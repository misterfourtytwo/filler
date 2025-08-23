# System Patterns

## Architecture Overview
- **CLEAN Architecture**: Strict separation between data, domain, and presentation layers
- **Feature-Based Structure**: Each feature contained in its own folder with domain/presentation separation

## Layer Patterns

### Data Layer
- **Drift ORM**: Type-safe SQL operations with code generation
- **Tables**: Canvas and Preferences entities with proper relationships
- **Database**: Single source of truth with helper methods

### Domain Layer  
- **Repository Pattern**: Abstract interfaces implemented by data layer
- **Models**: Immutable entities using Freezed code generation
- **Use Cases**: Encapsulated in repository methods

### Presentation Layer
- **BLoC Pattern**: Event-driven state management with Freezed
- **State Architecture**: Initial → Loading → Ready/Error pattern
- **View Decomposition**: Separate components for each state
- **Widget Composition**: Reusable UI components in dedicated kit

## Dependency Injection
- **AppScope**: InheritedWidget providing database and repositories
- **BLoC Providers**: Centralized in app root with MultiBlocProvider
- **Context Access**: Repository access through context.read<AppScope>()

## Navigation Pattern
- **MaterialPageRoute**: Simple navigation for prototype phase
- **Extensible**: Can migrate to go_router for complex routing needs

## State Management Patterns
- **Freezed Integration**: All events, states, and models use Freezed
- **Immutability**: No mutable state in BLoCs or models
- **Event Sourcing**: User actions converted to typed events

## Data Storage Patterns
- **Canvas Storage**: JSON-serialized ARGB pixel arrays
- **Preferences**: Simple key-value storage in database
- **Portability**: Platform-agnostic data formats

## Component Patterns
- **Design System**: Centralized tokens and theme factory
- **UI Kit**: Reusable components with consistent styling
- **State Views**: Dedicated widgets for each loading state
- **Composition**: Small, focused widgets following single responsibility
