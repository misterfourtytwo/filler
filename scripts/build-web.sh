#!/bin/bash

# Konstruktor Web Build Script
# Optimized for GitHub Pages deployment

set -e

# Parse command line arguments
BASE_HREF="${1:-/konstruktor/}"

echo "🚀 Building Konstruktor for web deployment..."
echo "📍 Base href: $BASE_HREF"

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
  --base-href="$BASE_HREF" \
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

# Copy .htaccess file for proper MIME type handling
if [ -f "../../web/.htaccess" ]; then
    cp ../../web/.htaccess .htaccess
    echo "📄 Copied .htaccess for MIME type configuration"
fi

# Copy _headers file for GitHub Pages MIME type handling
if [ -f "../../web/_headers" ]; then
    cp ../../web/_headers _headers
    echo "📄 Copied _headers for GitHub Pages MIME type configuration"
fi

echo "✅ Web build completed successfully!"
echo "📁 Build output: build/web/"
echo "🔗 Base href: $BASE_HREF"
echo ""
echo "🌐 To test locally with proper WASM MIME types:"
echo "   Option 1: python3 scripts/serve-local.py (recommended)"
echo "   Option 2: flutter run -d chrome --web-port 8080"
echo ""
echo "💡 Usage: ./scripts/build-web.sh [base-href]"
echo "   Examples:"
echo "   - GitHub Pages subdirectory: ./scripts/build-web.sh /konstruktor/"
echo "   - Root domain: ./scripts/build-web.sh /"
echo ""
echo "🚀 To deploy: push to main branch (GitHub Actions will handle deployment)"
