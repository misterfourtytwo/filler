# Design System

Purpose: Provide consistent tokens, themes, and reusable components tailored to Konstruktor's pixel canvas editor.

## Design Tokens

### Spacing Scale
- `spaceXs`: 4px - tight spacing for inline elements
- `spaceSm`: 8px - small gaps between related items  
- `spaceMd`: 12px - medium spacing for form fields
- `spaceLg`: 16px - standard component padding
- `spaceXl`: 24px - section spacing
- `spaceXxl`: 32px - page margins

### Border Radius
- `radiusSm`: 8px - input fields, small buttons
- `radiusMd`: 12px - primary buttons, cards
- `radiusLg`: 16px - large surfaces, dialogs

### Animation Durations
- `fast`: 120ms - micro-interactions, hovers
- `normal`: 200ms - state transitions, navigation
- `slow`: 320ms - complex animations, page transitions

### Color Palette
Vibrant colors optimized for pixel art creation:
- Primary Blue: `#1E88E5` - main interactive elements
- Red: `#E53935` - delete, warnings  
- Green: `#43A047` - success, save actions
- Yellow: `#FDD835` - highlights, active states
- Purple: `#8E24AA` - secondary actions
- Orange: `#FFA726` - accent colors

## Material 3 Theme Configuration

### Typography
- Uses system default with adaptive density
- Consistent with platform conventions

### Components
- **AppBar**: Surface-colored background for seamless integration
- **Buttons**: Medium radius (12px), consistent padding (16h×8v)
- **Input Fields**: Small radius (8px), dense layout
- **Cards**: Medium radius, surface elevation

## UI Kit Components

### Layout Components
- **CardSection**: Surface card with consistent padding and rounded corners
- **SectionTitle**: Styled headers for content sections

### Interactive Elements  
- **ColorSwatchButton**: Circular color picker for palette selection
- **ColorPalette**: Grid of color swatches for canvas painting
- **NumberFieldTile**: Labeled numeric input for preferences

### State Components
- **LoadingIndicator**: Centered circular progress for async operations
- **EmptyState**: Placeholder with icon and message for empty lists

## State-Based View Architecture

Each feature page implements three states:
- **Initial**: Blank or minimal state before data loads
- **Loading**: Shows loading indicator while fetching data  
- **Ready**: Renders full UI with loaded data

Implementation pattern:
```dart
BlocBuilder<FeatureBloc, FeatureState>(
  builder: (context, state) => state.map(
    initial: (_) => const InitialView(),
    loading: (_) => const LoadingView(), 
    ready: (s) => ReadyView(data: s),
  ),
)
```

## Usage Guidelines

### Token Usage
- Always use `DesignSystem` constants instead of magic numbers
- Apply spacing scale consistently across components
- Use semantic color names from palette

### Component Architecture  
- Keep components small and focused (single responsibility)
- Separate stateful logic into BLoCs
- Use Freezed for all immutable data structures
- Export components via `ui/uikit.dart` barrel file

### File Organization
- One component per file in `ui/uikit/` directory
- Name files with snake_case matching class names
- Include component purpose in documentation comments

### Responsive Design
- Use `VisualDensity.adaptivePlatformDensity` for platform adaptation
- Test layouts across mobile, tablet, and desktop breakpoints
- Prioritize touch-friendly sizing on mobile platforms 
