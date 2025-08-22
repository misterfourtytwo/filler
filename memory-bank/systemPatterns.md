# System Patterns

- CLEAN layers: data (Drift), domain (repositories/use-cases), presentation (BLoCs + Widgets).
- DI via `AppScope` InheritedWidget that provides database and repositories.
- Navigation via `Navigator` with typed routes (can migrate to `go_router` if needed).
- Canvas model stores JSON list of ARGB ints; small, portable across platforms.
