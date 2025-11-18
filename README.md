# Konstruktor - Pixel Canvas Editor

A colorful pixel canvas editor with gallery, preferences, and export capabilities. Create beautiful pixel art with an intuitive interface.

## 🎨 Features

- **Canvas Editor**: Create pixel art with customizable width, height, and insets
- **Color Palette**: Rich color selection with pattern support
- **Gallery**: Save and organize your creations
- **Export**: Export your artwork as PNG images
- **Preferences**: Customize default settings and theme
- **Cross-Platform**: Works on web, mobile, and desktop

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.24.0 or higher)
- Git repository on GitHub

### Local Development
```bash
# Clone the repository
git clone https://github.com/your-username/konstruktor.git
cd konstruktor

# Get dependencies
flutter pub get

# Run the app
flutter run -d chrome
```

### Build for Web
```bash
# Use the build script
./scripts/build-web.sh

# Or manually
flutter build web --release --web-renderer canvaskit
```

## 🌐 GitHub Pages Deployment

### Automatic Deployment (Recommended)

1. **Configure Repository Settings**:
   - Go to your GitHub repository
   - Navigate to **Settings** → **Pages**
   - Under **Source**, select **Deploy from a branch**
   - Choose **gh-pages** branch and **/(root)** folder
   - Click **Save**

2. **Enable GitHub Actions**:
   - Go to **Settings** → **Actions** → **General**
   - Set **Actions permissions** to **Allow all actions and reusable workflows**
   - Click **Save**

3. **Deploy**:
   - Push changes to the `main` branch
   - GitHub Actions will automatically build and deploy
   - Your app will be available at: `https://your-username.github.io/konstruktor/`

### Manual Deployment
```bash
# Build the app
./scripts/build-web.sh

# Deploy using gh-pages package
npx gh-pages -d build/web
```

## 📁 Project Structure

```
konstruktor/
├── lib/                    # Main application code
│   ├── app.dart           # App entry point
│   ├── main.dart          # Main function
│   ├── core/              # Core utilities
│   ├── data/              # Data layer (database)
│   ├── domain/            # Business logic
│   ├── features/          # Feature modules
│   │   ├── canvas/        # Canvas editor
│   │   ├── gallery/       # Gallery management
│   │   ├── home/          # Home page
│   │   └── prefs/         # Preferences
│   └── ui/                # UI components
├── web/                   # Web-specific files
│   ├── index.html         # Main HTML file
│   ├── manifest.json      # PWA manifest
│   └── 404.html          # Custom 404 page
├── scripts/               # Build scripts
├── .github/workflows/     # GitHub Actions
└── test/                  # Test files
```

## 🛠️ Technology Stack

- **Framework**: Flutter 3.24.0
- **State Management**: flutter_bloc
- **Database**: Drift (SQLite/IndexedDB)
- **Code Generation**: build_runner, freezed
- **Testing**: flutter_test, bloc_test
- **Web Renderer**: CanvasKit for optimal performance

## 🎯 Key Features

### Canvas Editor
- Grid-based pixel editing
- Customizable canvas dimensions
- Pattern and color selection
- Real-time preview

### Gallery Management
- Save and organize canvases
- Thumbnail previews
- Export functionality
- Search and filter

### Preferences
- Default canvas settings
- Theme customization
- User preferences persistence

### Export Capabilities
- PNG image export
- High-quality rendering
- Custom export settings

## 🔧 Development

### Code Generation
```bash
# Generate code
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/canvas/presentation/canvas_bloc_test.dart
```

### Code Quality
```bash
# Format code
dart format .

# Analyze code
dart analyze

# Run validation script
./tool/validate.sh
```

## 📱 Platform Support

- **Web**: Full support with PWA capabilities
- **Android**: Native app support
- **iOS**: Native app support
- **macOS**: Desktop app support

## 🚀 Performance Optimizations

- **CanvasKit Renderer**: Better performance for complex graphics
- **Tree Shaking**: Removes unused code
- **Resource Preloading**: Critical resources loaded early
- **Compression**: Optimized asset delivery
- **PWA Features**: Offline support and app-like experience

## 📊 Analytics and Monitoring

The app is configured for:
- Performance monitoring
- Error tracking
- User analytics
- SEO optimization

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and validation
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For issues and questions:
1. Check the [DEPLOYMENT.md](DEPLOYMENT.md) for deployment help
2. Review the test files for usage examples
3. Check GitHub Actions logs for build issues

---

**Built with ❤️ using Flutter**
