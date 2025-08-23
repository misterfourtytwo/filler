#!/bin/bash

# Filler Web Build Script
# Optimized for GitHub Pages deployment

set -e

echo "🚀 Building Filler for web deployment..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Run tests
echo "🧪 Running tests..."
flutter test

# Build for web with optimizations
echo "🔨 Building web app with optimizations..."
flutter build web \
  --release \
  --dart-define=FLUTTER_WEB_USE_SKIA=true \
  --tree-shake-icons

# Optimize build size
echo "📊 Optimizing build size..."

# Remove unnecessary files
cd build/web
rm -rf .dart_tool/
rm -rf packages/

# Create .nojekyll file for GitHub Pages
touch .nojekyll

echo "✅ Web build completed successfully!"
echo "📁 Build output: build/web/"
echo "🌐 To test locally: flutter run -d chrome --web-port 8080"
echo "🚀 To deploy: push to main branch (GitHub Actions will handle deployment)"
