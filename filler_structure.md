# Filler Project Code Guide - Explained Like You're 5! 🎨

## What is Filler? 

Imagine you have a coloring book, but instead of just coloring with crayons, you can draw cool patterns like stars, circles, zigzags, and even rotate them! That's what Filler is - a digital pixel art studio where you can create beautiful patterns on a grid.

## The Big Picture - How Everything Works Together 🌟

Think of Filler like a big toy box with different compartments:

1. **The Toy Box** (main.dart) - This is where everything starts
2. **The Instructions** (app.dart) - Tells all the parts how to work together  
3. **The Storage Room** (database) - Keeps all your drawings safe
4. **The Drawing Table** (canvas) - Where you create your art
5. **The Gallery** (gallery) - Shows all your saved drawings
6. **The Settings** (preferences) - Lets you change how things work

## Let's Explore Each Part! 🔍

### 1. The Toy Box - main.dart 🎁

```dart
void main() {
  // This is like opening the toy box!
  AppLogger.initialize(isDebug: kDebugMode);
  runApp(const MyApp());
}
```

**What it does:** This is the very first thing that runs when you start the app. It's like opening a toy box - it sets up everything and makes sure the app is ready to play!

**Key parts:**
- `AppLogger.initialize()` - Sets up a helper that writes down everything that happens (like a diary)
- `runApp()` - Actually starts the app and shows it on screen

### 2. The Instructions - app.dart 📋

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This is like reading the instruction manual!
    final db = AppDatabase.instance;
    final canvasRepo = CanvasRepository(db);
    final prefsRepo = PreferencesRepository(db);
    
    return AppScope(
      database: db,
      canvasRepository: canvasRepo,
      preferencesRepository: prefsRepo,
      child: MultiBlocProvider(
        // ... more setup
      ),
    );
  }
}
```

**What it does:** This is like the instruction manual that tells all the parts how to work together. It creates all the important helpers and connects them.

**Key helpers it creates:**
- `AppDatabase` - The storage room for all your drawings
- `CanvasRepository` - The helper that saves and loads your drawings
- `PreferencesRepository` - The helper that remembers your settings
- `AppScope` - A special container that makes all helpers available everywhere

### 3. The Storage Room - Database System 🗄️

The database is like a big filing cabinet that keeps all your drawings safe. It has two main drawers:

#### Drawer 1: Canvases (Your Drawings)
```dart
class Canvases extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withDefault(const Constant('Untitled'))();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  TextColumn get pixelsJson => text()(); // This stores your actual drawing!
  IntColumn get patternPaintColor => integer().withDefault(const Constant(0xFF000000))();
  IntColumn get canvasBackgroundColor => integer().withDefault(const Constant(0xFFFFFFFF))();
}
```

**What each part means:**
- `id` - Like a name tag for each drawing (1, 2, 3, etc.)
- `title` - What you call your drawing ("My Cool Art")
- `width` and `height` - How big your drawing is (like 10x10 squares)
- `pixelsJson` - The actual drawing data (what patterns are where)
- `patternPaintColor` - What color your patterns are
- `canvasBackgroundColor` - What color the background is

#### Drawer 2: Preferences (Your Settings)
```dart
class PreferenceKeyValues extends Table {
  TextColumn get key => text()(); // Like "width", "height", "defaultPattern"
  TextColumn get value => text()(); // Like "10", "8", "1"
  TextColumn get valueType => text()(); // Like "int", "string"
}
```

**What it does:** This remembers your favorite settings, like how big you want new drawings to be.

### 4. The Drawing Table - Canvas System 🎨

This is the most exciting part! It's where you actually create your art.

#### The Patterns - canvas_pattern.dart 🌈

```dart
enum CanvasPattern {
  empty,           // Nothing (like an eraser)
  solid,           // Just a solid color
  diagonal,        // Diagonal stripes
  checkerboard,    // Checkerboard pattern
  dots,            // Little dots
  cross,           // A cross shape
  triangle,        // A triangle
  circle,          // A circle
  star,            // A star
  wave,            // Wavy lines
  zigzag,          // Zigzag lines
  quarterCircle,   // A quarter circle
  inverseQuarterCircle, // The opposite of a quarter circle
}
```

**What it does:** These are like different stamps you can use! Each one draws a different pattern.

#### The Pattern Painter - How Patterns Are Drawn 🖌️

```dart
class PatternPainter extends CustomPainter {
  const PatternPainter(
    this.pattern,
    this.rotation = 0.0,
    this.paintColor = Colors.black,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // This is like the magic that actually draws each pattern!
    switch (pattern) {
      case CanvasPattern.solid:
        canvas.drawRect(bounds, paint); // Draws a solid square
        break;
      case CanvasPattern.circle:
        canvas.drawCircle(center, radius, paint); // Draws a circle
        break;
      // ... and so on for each pattern
    }
  }
}
```

**What it does:** This is like the magic wand that actually draws each pattern on the screen. It knows how to draw circles, stars, zigzags, and all the other cool patterns!

#### The Pixel Data - pixel_data.dart 📊

```dart
class PixelData {
  const PixelData({
    required int pattern,    // Which pattern (0-13)
    @Default(0.0) double rotation, // How much to turn it (0°, 90°, 180°, 270°)
  });
}
```

**What it does:** Each square in your drawing remembers two things:
1. **What pattern** it has (circle, star, etc.)
2. **How much it's rotated** (turned around)

#### The Canvas Model - canvas_model.dart 📋

```dart
class CanvasModel {
  const factory CanvasModel({
    required int id,                    // Drawing number
    required String title,              // Drawing name
    required int width,                 // How wide
    required int height,                // How tall
    required int insets,                // Border space
    required List<PixelData> pixels,    // All the squares with their patterns
    required Color patternPaintColor,   // Pattern color
    required Color canvasBackgroundColor, // Background color
    required DateTime createdAt,        // When you made it
    required DateTime updatedAt,        // When you last changed it
  });
}
```

**What it does:** This is like a complete description of one of your drawings - everything about it in one place!

### 5. The Brain - BLoC Pattern 🧠

BLoC stands for "Business Logic Component" - it's like the brain that controls everything!

#### Canvas BLoC - canvas_bloc.dart 🎯

```dart
// Events - Things that happen (like button presses)
@freezed
class CanvasEvent with _$CanvasEvent {
  const factory CanvasEvent.init() = _Init;                    // Start a new drawing
  const factory CanvasEvent.paint(int index) = _Paint;         // Draw on a square
  const factory CanvasEvent.rotatePixel(int index) = _RotatePixel; // Turn a square
  const factory CanvasEvent.save(String title) = _Save;        // Save the drawing
  // ... and more
}

// States - What the drawing looks like right now
@freezed
class CanvasState with _$CanvasState {
  const factory CanvasState.initial() = _Initial;              // Just starting
  const factory CanvasState.loading() = _Loading;              // Getting ready
  const factory CanvasState.ready({                            // Ready to draw!
    required int width,
    required int height,
    required int activeColor,           // Which pattern you're using
    required double patternRotation,    // How much it's turned
    required List<PixelData> pixels,    // All your squares
    required Color patternPaintColor,   // Pattern color
    required Color canvasBackgroundColor, // Background color
  }) = _Ready;
}
```

**What it does:** This is like the control center! When you tap a square, it sends a "paint" event. The BLoC then updates the state to show the new pattern on that square.

### 6. The Drawing Interface - Canvas Page 🖼️

#### Canvas Page - canvas_page.dart 📱

```dart
class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key, this.canvasId});
  final int? canvasId; // If you're editing an existing drawing
}
```

**What it does:** This is the actual screen where you draw! It shows:
- A grid of squares where you can draw
- A toolbox with patterns and colors
- Buttons to save your work

#### Canvas Grid - canvas_grid.dart 🔲

```dart
class CanvasGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width, // How many squares across
      ),
      itemCount: pixels.length, // Total number of squares
      itemBuilder: (context, index) {
        final pixel = pixels[index];
        return GestureDetector(
          onTap: () => onPixelTap(index),     // Tap to draw
          onLongPress: () => onPixelRotate(index), // Long press to rotate
          child: CustomPaint(
            painter: PatternPainter(
              CanvasPattern.fromValue(pixel.pattern),
              pixel.rotation,
              patternPaintColor,
            ),
          ),
        );
      },
    );
  }
}
```

**What it does:** This creates the actual grid of squares you draw on! Each square:
- Shows a pattern (circle, star, etc.)
- Can be tapped to change the pattern
- Can be long-pressed to rotate the pattern

### 7. The Gallery - Gallery System 🖼️

#### Gallery BLoC - gallery_bloc.dart 📚

```dart
@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.load() = _Load;           // Load all drawings
  const factory GalleryEvent.delete(int canvasId) = _Delete; // Delete a drawing
}

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = _Initial;
  const factory GalleryState.loading() = _Loading;
  const factory GalleryState.loaded({
    required List<GalleryItem> canvases, // All your saved drawings
  }) = _Loaded;
}
```

**What it does:** This manages showing all your saved drawings in a list, like a photo album!

#### Gallery Item - What Each Drawing Shows 📸

```dart
class GalleryItem {
  final int id;                    // Drawing number
  final String title;              // Drawing name
  final int width;                 // How wide
  final int height;                // How tall
  final String thumbnailPath;      // Small preview image
  final DateTime createdAt;        // When you made it
  final DateTime updatedAt;        // When you last changed it
}
```

**What it does:** This is like a photo in your album - it shows a small preview of your drawing with its name and when you made it.

### 8. The Settings - Preferences System ⚙️

#### Preferences BLoC - preferences_bloc.dart 🔧

```dart
@freezed
class PreferencesEvent with _$PreferencesEvent {
  const factory PreferencesEvent.load() = _Load;           // Load settings
  const factory PreferencesEvent.setWidth(int width) = _SetWidth;     // Change width
  const factory PreferencesEvent.setHeight(int height) = _SetHeight;  // Change height
  const factory PreferencesEvent.setInsets(int insets) = _SetInsets;  // Change border
  const factory PreferencesEvent.setDefaultPattern(int pattern) = _SetDefaultPattern; // Change default pattern
}

@freezed
class PreferencesState with _$PreferencesState {
  const factory PreferencesState.initial() = _Initial;
  const factory PreferencesState.loading() = _Loading;
  const factory PreferencesState.ready({
    required PreferencesModel preferences, // All your settings
  }) = _Ready;
}
```

**What it does:** This manages all your settings - like how big you want new drawings to be, what pattern to start with, etc.

### 9. The Navigation - Getting Around 🧭

#### App Navigation - app_navigation.dart 🗺️

```dart
class AppNavigation extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = DesignSystem.isDesktop(context);
    
    if (isDesktop) {
      // Use navigation rail (sidebar) for desktop
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(...), // Sidebar with buttons
            Expanded(child: _pages[_selectedIndex]), // Main content
          ],
        ),
      );
    } else {
      // Use bottom navigation for mobile
      return Scaffold(
        body: _pages[_selectedIndex], // Main content
        bottomNavigationBar: BottomNavigationBar(...), // Bottom buttons
      );
    }
  }
}
```

**What it does:** This is like a map that helps you get around the app! On desktop, it shows buttons on the side. On mobile, it shows buttons at the bottom.

### 10. The Design System - Making It Look Pretty 🎨

#### Design System - design_system.dart 🎨

```dart
class DesignSystem {
  // Spacing - How much space between things
  static const double spaceXs = 4.0;   // Tiny space
  static const double spaceSm = 8.0;   // Small space
  static const double spaceMd = 16.0;  // Medium space
  static const double spaceLg = 24.0;  // Large space
  static const double spaceXl = 32.0;  // Extra large space
  static const double spaceXxl = 48.0; // Huge space

  // Border radius - How round the corners are
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;

  // Animation duration - How long animations take
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
}
```

**What it does:** This makes sure everything in the app looks consistent and pretty! It defines how much space to use, how round corners should be, and how long animations should take.

## How Everything Works Together - The Magic! ✨

Here's the amazing part - how all these pieces work together:

1. **You start the app** → `main.dart` runs
2. **App sets up** → `app.dart` creates all the helpers
3. **You tap "New Canvas"** → Navigation takes you to canvas page
4. **Canvas page loads** → Canvas BLoC creates a new drawing
5. **You tap a square** → Canvas BLoC updates the pixel data
6. **Screen updates** → You see your pattern appear!
7. **You save** → Canvas BLoC saves to database
8. **You go to gallery** → Gallery BLoC loads all your drawings
9. **You see your art** → Gallery shows thumbnails of everything you made!

## The Data Flow - How Information Moves 📊

Think of it like a river of information:

```
User Action (tap square)
    ↓
Canvas Event (paint event)
    ↓
Canvas BLoC (processes event)
    ↓
Canvas State (updates pixel data)
    ↓
UI Rebuilds (shows new pattern)
    ↓
User sees change!
```

## The Storage Flow - How Things Are Saved 💾

```
Canvas State (your drawing)
    ↓
Canvas Model (organized data)
    ↓
JSON Serialization (converts to text)
    ↓
Database (saves to storage)
    ↓
File System (keeps it safe)
```

## Cool Features You Can Use! 🌟

### Pattern Rotation 🔄
- **Tap** a square to change its pattern
- **Long press** to rotate the pattern (0°, 90°, 180°, 270°)
- Each square can have a different rotation!

### Color System 🎨
- Choose what color your patterns will be
- Choose what color the background will be
- Colors are saved with each drawing

### Responsive Design 📱💻
- On desktop: Sidebar navigation, bigger canvas
- On mobile: Bottom navigation, touch-friendly buttons
- On web: Works in your browser!

### Export System 📤
- Save your drawings as PNG files
- Share them with friends
- Keep them forever!

## The Testing System - Making Sure Everything Works! 🧪

The app has lots of tests to make sure everything works perfectly:

```dart
// Example test
test('should paint pixel when paint event is added', () {
  final bloc = CanvasBloc(prefs: mockPrefs, repo: mockRepo);
  bloc.add(const CanvasEvent.paint(0));
  
  expect(bloc.state, isA<CanvasStateReady>());
  expect(bloc.state.pixels[0].pattern, equals(1)); // Should have pattern
});
```

**What tests do:**
- Make sure buttons work when you tap them
- Make sure drawings save correctly
- Make sure patterns appear in the right places
- Make sure the app doesn't crash

## The Logging System - The App's Diary 📝

The app writes down everything that happens:

```dart
AppLogger.canvas('User painted pixel', data: {'index': 5, 'pattern': 'circle'});
AppLogger.database('Saved canvas to database', data: {'id': 123});
AppLogger.error('Something went wrong', error: exception);
```

**What logging does:**
- Helps developers fix problems
- Shows what users are doing
- Records when things go wrong
- Makes the app more reliable

## The Memory Bank - Project Documentation 📚

The project has a special "Memory Bank" that remembers everything:

- `projectbrief.md` - What the app is supposed to do
- `productContext.md` - Why the app exists
- `systemPatterns.md` - How the code is organized
- `techContext.md` - What technology is used
- `activeContext.md` - What's being worked on right now
- `progress.md` - What's finished and what's left to do
- `backlog.md` - List of tasks to complete

This helps developers remember what they were doing and what needs to be done next!

## Summary - The Big Picture! 🎯

Filler is like a magical digital coloring book where:

1. **You create** beautiful patterns on a grid
2. **You rotate** patterns to make them look different
3. **You save** your artwork to look at later
4. **You share** your creations with others
5. **You customize** everything to your liking

The code is organized like a well-organized toy box, with each part having a specific job and working together to create something amazing!

**Key Principles:**
- **Simple and Clean** - Easy to understand and modify
- **Well-Tested** - Everything works reliably
- **Well-Documented** - Easy to learn and use
- **Responsive** - Works on all devices
- **Extensible** - Easy to add new features

That's Filler in a nutshell - a beautiful, well-organized pixel art studio that brings joy to creators everywhere! 🎨✨
