import 'package:bloc_test/bloc_test.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/prefs/domain/preferences_model.dart';
import 'package:filler/features/prefs/presentation/preferences_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/test_helpers.dart';

// Mock classes
class MockPreferencesRepository extends Mock implements PreferencesRepository {}

void main() {
  late PreferencesBloc preferencesBloc;
  late MockPreferencesRepository mockPrefsRepo;

  setUpAll(TestHelpers.initializeLogging);

  setUp(() {
    mockPrefsRepo = MockPreferencesRepository();
    preferencesBloc = PreferencesBloc(mockPrefsRepo);
  });

  tearDown(() {
    preferencesBloc.close();
  });

  group('PreferencesBloc', () {
    test('initial state is PreferencesState.initial', () {
      expect(preferencesBloc.state, equals(const PreferencesState.initial()));
    });

    group('PreferencesEvent.load', () {
      blocTest<PreferencesBloc, PreferencesState>(
        'emits [loading, ready] when preferences loaded successfully',
        build: () {
          when(() => mockPrefsRepo.get()).thenAnswer(
            (_) async => const PreferencesModel(
              width: 10,
              height: 10,
              insets: 0,
              defaultPattern: 0, // Empty pattern
            ),
          );
          return preferencesBloc;
        },
        act: (bloc) => bloc.add(const PreferencesEvent.load()),
        expect: () => [
          const PreferencesState.loading(),
          const PreferencesState.ready(
            width: 10,
            height: 10,
            insets: 0,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
        verify: (_) {
          verify(() => mockPrefsRepo.get()).called(1);
        },
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'handles repository errors gracefully without state change',
        build: () {
          when(
            () => mockPrefsRepo.get(),
          ).thenThrow(Exception('Database error'));
          return preferencesBloc;
        },
        act: (bloc) => bloc.add(const PreferencesEvent.load()),
        expect: () => [const PreferencesState.loading()],
        verify: (_) {
          verify(() => mockPrefsRepo.get()).called(1);
        },
      );
    });

    group('Preference Setting Events', () {
      blocTest<PreferencesBloc, PreferencesState>(
        'updates width when ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 15,
          insets: 2,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.setWidth(25)),
        expect: () => [
          const PreferencesState.ready(
            width: 25,
            height: 15,
            insets: 2,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'updates height when ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 15,
          insets: 2,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.setHeight(30)),
        expect: () => [
          const PreferencesState.ready(
            width: 10,
            height: 30,
            insets: 2,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'updates insets when ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 15,
          insets: 2,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.setInsets(5)),
        expect: () => [
          const PreferencesState.ready(
            width: 10,
            height: 15,
            insets: 5,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'updates color when ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 15,
          insets: 2,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.setPattern(2)),
        expect: () => [
          const PreferencesState.ready(
            width: 10,
            height: 15,
            insets: 2,
            defaultPattern: 2,
            themeMode: 2,
          ),
        ],
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'ignores updates when not ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.loading(),
        act: (bloc) => bloc.add(const PreferencesEvent.setWidth(25)),
        expect: () => [],
      );
    });

    group('PreferencesEvent.save', () {
      blocTest<PreferencesBloc, PreferencesState>(
        'saves preferences when ready',
        build: () {
          when(
            () => mockPrefsRepo.save(
              width: any(named: 'width'),
              height: any(named: 'height'),
              insets: any(named: 'insets'),
              defaultPattern: any(named: 'defaultPattern'),
              themeMode: any(named: 'themeMode'),
            ),
          ).thenAnswer((_) async {});
          return preferencesBloc;
        },
        seed: () => const PreferencesState.ready(
          width: 15,
          height: 20,
          insets: 3,
          defaultPattern: 2,
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.save()),
        expect: () => [],
        verify: (_) {
          verify(
            () => mockPrefsRepo.save(
              width: 15,
              height: 20,
              insets: 3,
              defaultPattern: 2,
              themeMode: 2,
            ),
          ).called(1);
        },
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'ignores save when not ready',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.loading(),
        act: (bloc) => bloc.add(const PreferencesEvent.save()),
        expect: () => [],
        verify: (_) {
          verifyNever(
            () => mockPrefsRepo.save(
              width: any(named: 'width'),
              height: any(named: 'height'),
              insets: any(named: 'insets'),
              defaultPattern: any(named: 'defaultPattern'),
              themeMode: any(named: 'themeMode'),
            ),
          );
        },
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'handles save errors gracefully',
        build: () {
          when(
            () => mockPrefsRepo.save(
              width: any(named: 'width'),
              height: any(named: 'height'),
              insets: any(named: 'insets'),
              defaultPattern: any(named: 'defaultPattern'),
              themeMode: any(named: 'themeMode'),
            ),
          ).thenThrow(Exception('Database error'));
          return preferencesBloc;
        },
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 10,
          insets: 0,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) => bloc.add(const PreferencesEvent.save()),
        expect: () => [],
        verify: (_) {
          verify(
            () => mockPrefsRepo.save(
              width: 10,
              height: 10,
              insets: 0,
              defaultPattern: 0, // Empty pattern
              themeMode: 2,
            ),
          ).called(1);
        },
      );
    });

    group('Multiple Events', () {
      blocTest<PreferencesBloc, PreferencesState>(
        'handles multiple preference updates correctly',
        build: () => preferencesBloc,
        seed: () => const PreferencesState.ready(
          width: 10,
          height: 10,
          insets: 0,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        ),
        act: (bloc) {
          bloc
            ..add(const PreferencesEvent.setWidth(15))
            ..add(const PreferencesEvent.setHeight(20))
            ..add(const PreferencesEvent.setInsets(2));
        },
        expect: () => [
          const PreferencesState.ready(
            width: 15,
            height: 10,
            insets: 0,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
          const PreferencesState.ready(
            width: 15,
            height: 20,
            insets: 0,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
          const PreferencesState.ready(
            width: 15,
            height: 20,
            insets: 2,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
      );

      blocTest<PreferencesBloc, PreferencesState>(
        'handles load and save sequence correctly',
        build: () {
          when(() => mockPrefsRepo.get()).thenAnswer(
            (_) async => const PreferencesModel(
              width: 10,
              height: 10,
              insets: 0,
              defaultPattern: 0, // Empty pattern
            ),
          );
          when(
            () => mockPrefsRepo.save(
              width: any(named: 'width'),
              height: any(named: 'height'),
              insets: any(named: 'insets'),
              defaultPattern: any(named: 'defaultPattern'),
              themeMode: any(named: 'themeMode'),
            ),
          ).thenAnswer((_) async {});
          return preferencesBloc;
        },
        act: (bloc) {
          bloc
            ..add(const PreferencesEvent.load())
            ..add(const PreferencesEvent.setWidth(15))
            ..add(const PreferencesEvent.save());
        },
        expect: () => [
          const PreferencesState.loading(),
          const PreferencesState.ready(
            width: 10,
            height: 10,
            insets: 0,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
          const PreferencesState.ready(
            width: 15,
            height: 10,
            insets: 0,
            defaultPattern: 0, // Empty pattern
            themeMode: 2,
          ),
        ],
        verify: (_) {
          verify(() => mockPrefsRepo.get()).called(1);
          verify(
            () => mockPrefsRepo.save(
              width: 15,
              height: 10,
              insets: 0,
              defaultPattern: 0, // Empty pattern
              themeMode: 2,
            ),
          ).called(1);
        },
      );
    });
  });
}
