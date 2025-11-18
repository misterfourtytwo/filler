# VS Code Configuration for Konstruktor

This directory contains VS Code configurations for developing the Konstruktor Flutter app.

## Files

### launch.json
Debug configurations for running the app:
- Konstruktor (Web - Chrome): Standard web debug with Chrome
- Konstruktor (Web - Chrome with WASM): Web debug with explicit WASM support enabled
- Konstruktor (Web - Edge): Web debug with Edge browser
- Konstruktor (Web - Release Mode): Production build testing
- Konstruktor (Web - Profile Mode): Performance profiling

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
For web development with WASM, use "Konstruktor (Web - Chrome with WASM)".

## WASM Support

The app uses sqlite3 WASM for web database support with IndexedDB backend.
