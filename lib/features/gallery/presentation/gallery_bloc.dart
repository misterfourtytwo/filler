import 'dart:convert';

import 'package:filler/core/logging.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_bloc.freezed.dart';

/// Events for gallery operations.
///
/// Supports loading and deleting saved canvases from the repository.
@freezed
class GalleryEvent with _$GalleryEvent {
  /// Loads all saved canvases from the database.
  const factory GalleryEvent.load() = _Load;

  /// Deletes a canvas by ID.
  const factory GalleryEvent.delete(int canvasId) = _Delete;
}

/// States for gallery data loading lifecycle.
///
/// Follows standard initial → loading → loaded pattern for
/// displaying saved canvas thumbnails.
@freezed
class GalleryState with _$GalleryState {
  /// Initial state before loading begins.
  const factory GalleryState.initial() = _Initial;

  /// Loading state while fetching canvases.
  const factory GalleryState.loading() = _Loading;

  /// Loaded state with canvas thumbnails.
  const factory GalleryState.loaded({required List<GalleryItem> items}) =
      _Loaded;
}

/// Gallery item representing a saved canvas for display.
///
/// Contains canvas data needed for thumbnail rendering including
/// dimensions, pixel data, and colors. Used in gallery grid views.
@freezed
class GalleryItem with _$GalleryItem {
  /// Creates a gallery item with canvas data.
  const factory GalleryItem({
    /// Unique canvas identifier.
    required int id,

    /// Canvas width in pixels.
    required int width,

    /// Canvas height in pixels.
    required int height,

    /// Canvas padding/insets.
    required int insets,

    /// Pixel data with pattern indices and rotations in row-major order.
    required List<PixelData> pixels,

    /// Color to use for painting patterns.
    required Color patternPaintColor,

    /// Background color for the canvas.
    required Color canvasBackgroundColor,
  }) = _GalleryItem;
}

/// Business logic component for gallery operations.
///
/// Manages loading and displaying saved canvases from the repository.
/// Converts database entities to display-friendly gallery items.
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  /// Creates a gallery BLoC with canvas repository.
  GalleryBloc(this._repo) : super(const GalleryState.initial()) {
    AppLogger.bloc('Gallery', 'BLoC Created', null, 'initial');
    on<_Load>((event, emit) async {
      AppLogger.bloc('Gallery', 'Load Event', 'initial', 'loading');
      emit(const GalleryState.loading());

      try {
        final stopwatch = Stopwatch()..start();
        final canvases = await _repo.getAllModels();
        stopwatch.stop();

        AppLogger.database(
          'Loaded canvases from database',
          data: {
            'count': canvases.length,
            'loadTime': '${stopwatch.elapsed.inMilliseconds}ms',
          },
        );

        final items = <GalleryItem>[];
        for (final canvas in canvases) {
          try {
            final item = GalleryItem(
              id: canvas.id,
              width: canvas.width,
              height: canvas.height,
              insets: canvas.insets,
              pixels: canvas.pixels,
              patternPaintColor: canvas.patternPaintColor,
              canvasBackgroundColor: canvas.canvasBackgroundColor,
            );
            items.add(item);

            AppLogger.canvas(
              'Processed canvas for gallery',
              data: {
                'id': canvas.id,
                'title': canvas.title,
                'dimensions': '${canvas.width}x${canvas.height}',
                'pixelCount': canvas.pixels.length,
              },
            );
          } on Exception catch (e, stackTrace) {
            AppLogger.error(
              'Failed to process canvas for gallery',
              error: e,
              stackTrace: stackTrace,
              data: {'canvasId': canvas.id, 'title': canvas.title},
            );
          }
        }

        AppLogger.canvas(
          'Gallery items prepared',
          data: {
            'totalCanvases': canvases.length,
            'validItems': items.length,
            'skippedItems': canvases.length - items.length,
          },
        );

        emit(GalleryState.loaded(items: items));
        AppLogger.bloc('Gallery', 'Load Complete', 'loading', 'loaded');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to load gallery',
          error: e,
          stackTrace: stackTrace,
        );
        // Could emit error state here
      }
    });
    on<_Delete>((event, emit) async {
      AppLogger.bloc('Gallery', 'Delete Event', 'loaded', 'loading');
      emit(const GalleryState.loading());

      try {
        final stopwatch = Stopwatch()..start();
        await _repo.remove(event.canvasId);
        stopwatch.stop();

        AppLogger.database(
          'Deleted canvas from database',
          data: {
            'canvasId': event.canvasId,
            'deleteTime': '${stopwatch.elapsed.inMilliseconds}ms',
          },
        );

        // Reload the gallery after deletion
        final rows = await _repo.getAll();
        final items = <GalleryItem>[];

        for (final canvas in rows) {
          try {
            // Decode pixel data from JSON - handle both old and new formats
            final rawPixels = jsonDecode(canvas.pixelsJson) as List;
            final pixels = rawPixels.map((pixel) {
              if (pixel is int) {
                // Old format: just pattern index
                return PixelData(pattern: pixel);
              } else if (pixel is Map<String, dynamic>) {
                // New format: pattern and rotation
                return PixelData.fromJson(pixel);
              } else {
                // Fallback
                return PixelData(pattern: 0);
              }
            }).toList();

            final item = GalleryItem(
              id: canvas.id,
              width: canvas.width,
              height: canvas.height,
              insets: canvas.insets,
              pixels: pixels,
              patternPaintColor: Color(canvas.patternPaintColor),
              canvasBackgroundColor: Color(canvas.canvasBackgroundColor),
            );
            items.add(item);
          } on Exception catch (e, stackTrace) {
            AppLogger.error(
              'Failed to decode canvas pixels after deletion',
              error: e,
              stackTrace: stackTrace,
              data: {
                'canvasId': canvas.id,
                'title': canvas.title,
                'jsonLength': canvas.pixelsJson.length,
              },
            );
          }
        }

        emit(GalleryState.loaded(items: items));
        AppLogger.bloc('Gallery', 'Delete Complete', 'loading', 'loaded');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to delete canvas',
          error: e,
          stackTrace: stackTrace,
          data: {'canvasId': event.canvasId},
        );
        // Reload to show current state
        add(const GalleryEvent.load());
      }
    });
  }

  /// Repository for accessing saved canvas data.
  final CanvasRepository _repo;
}
