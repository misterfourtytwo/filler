# Project Brief

Build "Filler" – a colorful pixel canvas editor with gallery, preferences, and export.

- Home: navigate to New Canvas, Gallery, Preferences.
- Canvas Editor: width×height grid, insets, color picker, save to gallery.
- Gallery: list canvases; tap to view; from detail, Edit or Export PNG.
- Preferences: default width, height, insets, color.
- Storage: Drift database (SQLite on mobile/desktop, IndexedDB on web).
- State: flutter_bloc.
- DI: InheritedWidget.
- Platforms: macOS, Android, Web (Chrome).
- Quality: strict lints, tests, CI/CD via Codemagic; Docker for builds.
