import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:filler/data/database.dart';
import 'package:filler/domain/repositories.dart';
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
            Canvase(
              id: 1,
              title: 'Canvas 1',
              width: 2,
              height: 2,
              insets: 0,
              pixelsJson: jsonEncode([
                {'pattern': 1, 'rotation': 0.0},
                {'pattern': 2, 'rotation': 0.0},
                {'pattern': 3, 'rotation': 0.0},
                {'pattern': 4, 'rotation': 0.0},
              ]),
              patternPaintColor: 0xFF000000,
              canvasBackgroundColor: 0xFFFFFFFF,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
            Canvase(
              id: 2,
              title: 'Canvas 2',
              width: 3,
              height: 1,
              insets: 1,
              pixelsJson: jsonEncode([
                {'pattern': 0xFFFDD835, 'rotation': 0.0},
                {'pattern': 0xFFFFA726, 'rotation': 0.0},
                {'pattern': 0xFF1E88E5, 'rotation': 0.0},
              ]),
              patternPaintColor: 0xFF000000,
              canvasBackgroundColor: 0xFFFFFFFF,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          ];

          when(
            () => mockCanvasRepo.getAll(),
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
                  PixelData(pattern: 0xFF2196F3),
                  PixelData(pattern: 0xFFE53935),
                  PixelData(pattern: 0xFF43A047),
                  PixelData(pattern: 0xFF8E24AA),
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
                  PixelData(pattern: 0xFFFDD835),
                  PixelData(pattern: 0xFFFFA726),
                  PixelData(pattern: 0xFF1E88E5),
                ],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAll()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'emits [loading, loaded] with empty list when no canvases exist',
        build: () {
          when(() => mockCanvasRepo.getAll()).thenAnswer((_) async => []);
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(items: []),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAll()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'stays in loading state when repository throws error',
        build: () {
          when(
            () => mockCanvasRepo.getAll(),
          ).thenThrow(Exception('Database error'));
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [const GalleryState.loading()],
        verify: (_) {
          verify(() => mockCanvasRepo.getAll()).called(1);
        },
      );

      blocTest<GalleryBloc, GalleryState>(
        'handles invalid JSON in canvas data gracefully',
        build: () {
          final canvasWithInvalidJson = Canvase(
            id: 1,
            title: 'Invalid Canvas',
            width: 2,
            height: 2,
            insets: 0,
            pixelsJson: 'invalid-json-data',
            patternPaintColor: 0xFF000000,
            canvasBackgroundColor: 0xFFFFFFFF,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          final validCanvas = Canvase(
            id: 2,
            title: 'Valid Canvas',
            width: 1,
            height: 1,
            insets: 0,
            pixelsJson: jsonEncode([
              {'pattern': 0xFF2196F3, 'rotation': 0.0},
            ]),
            patternPaintColor: 0xFF000000,
            canvasBackgroundColor: 0xFFFFFFFF,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

          when(
            () => mockCanvasRepo.getAll(),
          ).thenAnswer((_) async => [canvasWithInvalidJson, validCanvas]);
          return galleryBloc;
        },
        act: (bloc) => bloc.add(const GalleryEvent.load()),
        expect: () => [
          const GalleryState.loading(),
          const GalleryState.loaded(
            items: [
              GalleryItem(
                id: 2,
                width: 1,
                height: 1,
                insets: 0,
                pixels: [PixelData(pattern: 0xFF2196F3)],
                patternPaintColor: Color(0xFF000000),
                canvasBackgroundColor: Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
        verify: (_) {
          verify(() => mockCanvasRepo.getAll()).called(1);
        },
      );
    });

    group('Multiple Events', () {
      blocTest<GalleryBloc, GalleryState>(
        'handles multiple load events correctly',
        build: () {
          when(() => mockCanvasRepo.getAll()).thenAnswer((_) async => []);
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
