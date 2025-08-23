import 'package:bloc_test/bloc_test.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/canvas/domain/canvas_model.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:filler/features/gallery/presentation/gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/test_helpers.dart';

// Mock classes
class MockCanvasRepository extends Mock implements CanvasRepository {}

void main() {
  late GalleryBloc galleryBloc;
  late MockCanvasRepository mockCanvasRepo;

  setUpAll(TestHelpers.initializeLogging);

  setUp(() {
    mockCanvasRepo = MockCanvasRepository();
    galleryBloc = GalleryBloc(mockCanvasRepo);
  });

  tearDown(() {
    galleryBloc.close();
  });

  group('GalleryBloc', () {
    test('initial state is GalleryState.initial', () {
      expect(galleryBloc.state, equals(const GalleryState.initial()));
    });

    group('GalleryEvent.load', () {
      blocTest<GalleryBloc, GalleryState>(
        'emits [loading, loaded] when canvases loaded successfully',
        build: () {
          final mockCanvases = [
            CanvasModel(
              id: 1,
              title: 'Canvas 1',
              width: 2,
              height: 2,
              insets: 0,
              pixels: const [
                PixelData(pattern: 0xFF2196F3, rotation: 0.0),
                PixelData(pattern: 0xFFE53935, rotation: 0.0),
                PixelData(pattern: 0xFF43A047, rotation: 0.0),
                PixelData(pattern: 0xFF8E24AA, rotation: 0.0),
              ],
              patternPaintColor: const Color(0xFF000000),
              canvasBackgroundColor: const Color(0xFFFFFFFF),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
            CanvasModel(
              id: 2,
              title: 'Canvas 2',
              width: 3,
              height: 1,
              insets: 1,
              pixels: const [
                PixelData(pattern: 0xFFFDD835, rotation: 0.0),
                PixelData(pattern: 0xFFFFA726, rotation: 0.0),
                PixelData(pattern: 0xFF1E88E5, rotation: 0.0),
              ],
              patternPaintColor: const Color(0xFF000000),
              canvasBackgroundColor: const Color(0xFFFFFFFF),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ];

          when(
            () => mockCanvasRepo.getAllModels(),
          ).thenAnswer((_) async => mockCanvases);
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(
            items: [
              GalleryItem(
                id: 1,
                width: 2,
                height: 2,
                insets: 0,
                pixels: [
                  PixelData(pattern: 0xFF2196F3, rotation: 0.0),
                  PixelData(pattern: 0xFFE53935, rotation: 0.0),
                  PixelData(pattern: 0xFF43A047, rotation: 0.0),
                  PixelData(pattern: 0xFF8E24AA, rotation: 0.0),
                ],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
              GalleryItem(
                id: 2,
                width: 3,
                height: 1,
                insets: 1,
                pixels: [
                  PixelData(pattern: 0xFFFDD835, rotation: 0.0),
                  PixelData(pattern: 0xFFFFA726, rotation: 0.0),
                  PixelData(pattern: 0xFF1E88E5, rotation: 0.0),
                ],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAllModels()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'emits [loading, loaded] with empty list when no canvases exist',
        build: () {
          when(() => mockCanvasRepo.getAllModels()).thenAnswer((_) async => []);
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(items: []),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAllModels()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'stays in loading state when repository throws error',
        build: () {
          when(
            () => mockCanvasRepo.getAllModels(),
          ).thenThrow(Exception('Database error'));
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [const GalleryState.loading()],
        verify: (_) {
          verify(() => mockCanvasRepo.getAllModels()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'handles canvas processing errors gracefully',
        build: () {
          final canvasWithError = CanvasModel(
            id: 1,
            title: 'Canvas With Error',
            width: 2,
            height: 2,
            insets: 0,
            pixels: const [
              PixelData(pattern: 0xFF2196F3, rotation: 0.0),
              PixelData(pattern: 0xFFE53935, rotation: 0.0),
              PixelData(pattern: 0xFF43A047, rotation: 0.0),
              PixelData(pattern: 0xFF8E24AA, rotation: 0.0),
            ],
            patternPaintColor: const Color(0xFF000000),
            canvasBackgroundColor: const Color(0xFFFFFFFF),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          final validCanvas = CanvasModel(
            id: 2,
            title: 'Valid Canvas',
            width: 1,
            height: 1,
            insets: 0,
            pixels: const [PixelData(pattern: 0xFF2196F3, rotation: 0.0)],
            patternPaintColor: const Color(0xFF000000),
            canvasBackgroundColor: const Color(0xFFFFFFFF),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          when(
            () => mockCanvasRepo.getAllModels(),
          ).thenAnswer((_) async => [canvasWithError, validCanvas]);
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(
            items: [
              GalleryItem(
                id: 1,
                width: 2,
                height: 2,
                insets: 0,
                pixels: [
                  PixelData(pattern: 0xFF2196F3, rotation: 0.0),
                  PixelData(pattern: 0xFFE53935, rotation: 0.0),
                  PixelData(pattern: 0xFF43A047, rotation: 0.0),
                  PixelData(pattern: 0xFF8E24AA, rotation: 0.0),
                ],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
              GalleryItem(
                id: 2,
                width: 1,
                height: 1,
                insets: 0,
                pixels: [PixelData(pattern: 0xFF2196F3, rotation: 0.0)],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAllModels()).called(1);
        },
      );
    });

    group('Multiple Events', () {
      blocTest<GalleryBloc, GalleryState>(
        'handles multiple load events correctly',
        build: () {
          when(() => mockCanvasRepo.getAllModels()).thenAnswer((_) async => []);
          return galleryBloc;
        },
        act: (bloc) {
          bloc
            ..add(const GalleryEvent.load())
            ..add(const GalleryEvent.load());
        },
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(items: []),
          const GalleryState.loading(),
          const GalleryState.loaded(items: []),
        ],
      );
    });
  });
}
