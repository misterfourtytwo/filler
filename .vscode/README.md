# VS Code Configuration for Filler

This directory contains VS Code configurations for developing the Filler Flutter app.

## Files

### launch.json
Debug configurations for running the app:
- Filler (Web - Chrome): Standard web debug with Chrome
- Filler (Web - Chrome with WASM): Web debug with explicit WASM support enabled
- Filler (Web - Edge): Web debug with Edge browser
- Filler (Web - Release Mode): Production build testing
- Filler (Web - Profile Mode): Performance profiling

### tasks.json
Quick access to common development tasks:
- Build Web: Debug and release builds
- Code Generation: Freezed/Drift code generation
- Tests: Run test suite
- Formatting: Apply Dart formatting
- Analysis: Run static analysis

### settings.json
Project-specific VS Code settings with Dart/Flutter optimizations

### extensions.json
Recommended VS Code extensions for Flutter development

## Usage

Press F5 or select Run > Start Debugging and choose a configuration.
For web development with WASM, use "Filler (Web - Chrome with WASM)".

## WASM Support

The app uses sqlite3 WASM for web database support with IndexedDB backend.
