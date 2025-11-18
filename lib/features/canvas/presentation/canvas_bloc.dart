import 'dart:math';

import 'package:filler/core/logging.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/canvas/domain/canvas_model.dart';
import 'package:filler/features/canvas/domain/custom_pattern.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'canvas_bloc.freezed.dart';

/// Events for canvas editing operations.
///
/// Defines user interactions with the pixel canvas including
/// initialization, color selection, painting, and saving.
@freezed
sealed class CanvasEvent with _$CanvasEvent {
  /// Initializes canvas with default preferences.
  const factory CanvasEvent.init() = _Init;

  /// Loads an existing canvas by ID for editing.
  const factory CanvasEvent.load(int canvasId) = _Load;

  /// Changes the active painting pattern.
  const factory CanvasEvent.setActivePatternId(int pattern) =
      _SetactivePatternId;

  /// Rotates the active pattern by the given angle in radians.
  const factory CanvasEvent.rotatePattern(double angle) = _RotatePattern;

  /// Sets a custom pattern as the active pattern.
  const factory CanvasEvent.setCustomPattern(CustomPattern pattern) =
      _SetCustomPattern;

  /// Paints a pixel at the given flat array index.
  const factory CanvasEvent.paint(int index) = _Paint;

  /// Rotates a pixel at the given flat array index.
  const factory CanvasEvent.rotatePixel(int index) = _RotatePixel;

  /// Fills all empty canvas cells with the currently active pattern.
  const factory CanvasEvent.fill() = _Fill;

  /// Saves the current canvas with given title.
  const factory CanvasEvent.save(String title) = _Save;

  /// Updates the pattern paint color.
  const factory CanvasEvent.setPatternPaintColor(Color color) =
      _SetPatternPaintColor;

  /// Updates the canvas background color.
  const factory CanvasEvent.setCanvasBackgroundColor(Color color) =
      _SetCanvasBackgroundColor;
}

/// States representing the canvas editor lifecycle.
///
/// Follows the standard initial → loading → ready pattern.
/// Ready state contains all canvas data including dimensions and pixels.
@freezed
sealed class CanvasState with _$CanvasState {
  /// Initial state before canvas setup.
  const factory CanvasState.initial() = _Initial;

  /// Loading state while fetching preferences.
  const factory CanvasState.loading() = _Loading;

  /// Ready state with active canvas data.
  const factory CanvasState.ready({
    /// Canvas width in pixels.
    required int width,

    /// Canvas height in pixels.
    required int height,

    /// Padding/insets around drawable area.
    required int insets,

    /// Currently selected painting pattern as integer index.
    required int activePatternId,

    /// Pattern rotation angle in radians.
    required double patternRotation,

    /// Custom pattern if active (null if using built-in patterns).
    CustomPattern? customPattern,

    /// Pixel data with pattern indices and rotations in row-major order.
    required List<PixelData> pixels,

    /// Color to use for painting patterns.
    required Color patternPaintColor,

    /// Background color for the canvas.
    required Color canvasBackgroundColor,
  }) = _Ready;
}

/// Business logic component for canvas editing operations.
///
/// Manages canvas state including dimensions, pixel data, and active color.
/// Handles painting, color selection, and saving to repository. Uses
/// preferences to initialize new canvases with default settings.
class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  /// Creates a canvas BLoC with required repositories.
  CanvasBloc({required this.prefs, required this.repo})
    : super(const CanvasState.initial()) {
    AppLogger.bloc('Canvas', 'BLoC Created', null, 'initial');
    on<_Init>((event, emit) async {
      AppLogger.bloc('Canvas', 'Init Event', 'initial', 'loading');
      emit(const CanvasState.loading());

      try {
        final stopwatch = Stopwatch()..start();
        final p = await prefs.get();
        stopwatch.stop();

        AppLogger.preferences(
          'Loaded preferences from key-value store',
          data: {
            'width': p.width,
            'height': p.height,
            'insets': p.insets,
            'defaultPattern': p.defaultPattern,
          },
        );
        AppLogger.performance('Preferences fetch', stopwatch.elapsed);

        final pixelCount = p.width * p.height;
        final pixels = List<PixelData>.generate(
          pixelCount,
          (index) =>
              const PixelData(pattern: 0), // Always start with empty pattern
        );

        AppLogger.canvas(
          'Initialized canvas',
          data: {
            'dimensions': '${p.width}x${p.height}',
            'pixelCount': pixelCount,
            'insets': p.insets,
            'defaultPattern': p.defaultPattern,
            'initialPattern': 0, // Always start with empty pattern
          },
        );

        emit(
          CanvasState.ready(
            width: p.width,
            height: p.height,
            insets: p.insets,
            activePatternId: 0, // Start with empty pattern as active
            patternRotation: 0.0,
            pixels: pixels,
            patternPaintColor: const Color(0xFF000000), // Default black
            canvasBackgroundColor: const Color(0xFFFFFFFF), // Default white
          ),
        );

        AppLogger.bloc('Canvas', 'Init Complete', 'loading', 'ready');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to initialize canvas',
          error: e,
          stackTrace: stackTrace,
        );
        // Stay in loading state or emit error state if you have one
      }
    });
    on<_Load>((event, emit) async {
      AppLogger.bloc('Canvas', 'Load Event', 'initial', 'loading');
      emit(const CanvasState.loading());

      try {
        final stopwatch = Stopwatch()..start();
        final canvas = await repo.getModelById(event.canvasId);
        stopwatch.stop();

        if (canvas == null) {
          AppLogger.warning('Canvas not found', data: {'id': event.canvasId});
          return;
        }

        AppLogger.canvas(
          'Loaded canvas from database',
          data: {
            'id': canvas.id,
            'title': canvas.title,
            'dimensions': '${canvas.width}x${canvas.height}',
            'pixelCount': canvas.pixels.length,
            'loadTime': '${stopwatch.elapsed.inMilliseconds}ms',
          },
        );

        emit(
          CanvasState.ready(
            width: canvas.width,
            height: canvas.height,
            insets: canvas.insets,
            activePatternId: 0, // Default to first pattern
            patternRotation: 0.0,
            pixels: canvas.pixels,
            patternPaintColor: canvas.patternPaintColor,
            canvasBackgroundColor: canvas.canvasBackgroundColor,
          ),
        );

        AppLogger.bloc('Canvas', 'Load Complete', 'loading', 'ready');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to load canvas',
          error: e,
          stackTrace: stackTrace,
          data: {'id': event.canvasId},
        );
      }
    });
    on<_SetactivePatternId>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              AppLogger.canvas(
                'Active color changed',
                data: {'from': color, 'to': event.pattern},
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: event.pattern,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: px,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {},
      );
    });
    on<_Paint>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              if (event.index < 0 || event.index >= px.length) {
                AppLogger.warning(
                  'Invalid paint index',
                  data: {'index': event.index, 'pixelCount': px.length},
                );
                return;
              }

              final copy = List<PixelData>.from(px);
              copy[event.index] = PixelData(pattern: color, rotation: rotation);

              AppLogger.canvas(
                'Pixel painted',
                data: {
                  'index': event.index,
                  'pattern': color,
                  'rotation': '${(rotation * 180 / pi).toStringAsFixed(1)}°',
                  'position': '${event.index % w},${event.index ~/ w}',
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: copy,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {
          AppLogger.warning('Paint called but canvas not ready');
        },
      );
    });
    on<_Save>((event, emit) async {
      AppLogger.canvas(
        'Save requested',
        data: {
          'title': event.title,
          'currentState': state.runtimeType.toString(),
        },
      );

      await state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) async {
              try {
                final stopwatch = Stopwatch()..start();

                // Create domain model for saving
                final canvasModel = CanvasModel(
                  id: 0, // Will be set by database
                  title: event.title,
                  width: w,
                  height: h,
                  insets: ins,
                  pixels: px,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );

                AppLogger.canvas(
                  'Saving canvas to database',
                  data: {
                    'title': event.title,
                    'dimensions': '${w}x$h',
                    'insets': ins,
                    'pixelCount': px.length,
                  },
                );

                final canvasId = await repo.addModel(canvasModel);

                stopwatch.stop();
                AppLogger.performance(
                  'Canvas save',
                  stopwatch.elapsed,
                  data: {'canvasId': canvasId, 'title': event.title},
                );

                AppLogger.canvas(
                  'Canvas saved successfully',
                  data: {'id': canvasId, 'title': event.title},
                );
              } on Exception catch (e, stackTrace) {
                AppLogger.error(
                  'Failed to save canvas',
                  error: e,
                  stackTrace: stackTrace,
                  data: {'title': event.title, 'dimensions': '${w}x$h'},
                );
              }
            },
        orElse: () {
          AppLogger.warning(
            'Save called but canvas not ready',
            data: {
              'title': event.title,
              'currentState': state.runtimeType.toString(),
            },
          );
        },
      );
    });
    on<_RotatePattern>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              // Angle picker sends absolute angles, not deltas
              final newRotation = event.angle;

              AppLogger.canvas(
                'Pattern rotation changed',
                data: {
                  'from': '${(rotation * 180 / pi).toStringAsFixed(1)}°',
                  'to': '${(newRotation * 180 / pi).toStringAsFixed(1)}°',
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: newRotation,
                  customPattern: customPattern,
                  pixels: px,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {},
      );
    });
    on<_SetCustomPattern>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              AppLogger.canvas(
                'Custom pattern set',
                data: {
                  'patternId': event.pattern.id,
                  'gridSize': event.pattern.gridSize,
                  'isEmpty': event.pattern.isEmpty,
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: event.pattern,
                  pixels: px,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {},
      );
    });
    on<_RotatePixel>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              if (event.index < 0 || event.index >= px.length) {
                AppLogger.warning(
                  'Invalid rotate index',
                  data: {'index': event.index, 'pixelCount': px.length},
                );
                return;
              }

              final copy = List<PixelData>.from(px);
              final currentPixel = copy[event.index];
              copy[event.index] = currentPixel.withNextRotation();

              AppLogger.canvas(
                'Pixel rotated',
                data: {
                  'index': event.index,
                  'pattern': currentPixel.pattern,
                  'rotation':
                      '${(currentPixel.rotation * 180 / pi).toStringAsFixed(1)}° → ${(copy[event.index].rotation * 180 / pi).toStringAsFixed(1)}°',
                  'position': '${event.index % w},${event.index ~/ w}',
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: copy,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {
          AppLogger.warning('Rotate pixel called but canvas not ready');
        },
      );
    });
    on<_Fill>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              final copy = List<PixelData>.from(px);
              int filledCount = 0;

              // Fill all empty cells (pattern 0) with the active pattern
              for (int i = 0; i < copy.length; i++) {
                if (copy[i].pattern == 0) {
                  // Empty pattern
                  copy[i] = PixelData(pattern: color);
                  filledCount++;
                }
              }

              AppLogger.canvas(
                'Canvas filled',
                data: {
                  'filledCells': filledCount,
                  'totalCells': copy.length,
                  'activePatternId': color,
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: copy,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {
          AppLogger.warning('Fill called but canvas not ready');
        },
      );
    });
    on<_SetPatternPaintColor>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              AppLogger.canvas(
                'Pattern paint color changed',
                data: {
                  'from':
                      '0x${patternPaintColor.toARGB32().toRadixString(16).toUpperCase()}',
                  'to':
                      '0x${event.color.toARGB32().toRadixString(16).toUpperCase()}',
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: px,
                  patternPaintColor: event.color,
                  canvasBackgroundColor: canvasBackgroundColor,
                ),
              );
            },
        orElse: () {},
      );
    });
    on<_SetCanvasBackgroundColor>((event, emit) {
      state.maybeWhen(
        ready:
            (
              w,
              h,
              ins,
              color,
              rotation,
              customPattern,
              px,
              patternPaintColor,
              canvasBackgroundColor,
            ) {
              AppLogger.canvas(
                'Canvas background color changed',
                data: {
                  'from':
                      '0x${canvasBackgroundColor.toARGB32().toRadixString(16).toUpperCase()}',
                  'to':
                      '0x${event.color.toARGB32().toRadixString(16).toUpperCase()}',
                },
              );

              emit(
                CanvasState.ready(
                  width: w,
                  height: h,
                  insets: ins,
                  activePatternId: color,
                  patternRotation: rotation,
                  customPattern: customPattern,
                  pixels: px,
                  patternPaintColor: patternPaintColor,
                  canvasBackgroundColor: event.color,
                ),
              );
            },
        orElse: () {},
      );
    });
  }

  /// Repository for user preferences and defaults.
  final PreferencesRepository prefs;

  /// Repository for canvas persistence.
  final CanvasRepository repo;
}
