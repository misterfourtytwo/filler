# Konstruktor Build & Development Scripts

This directory contains scripts for building, testing, and serving the Konstruktor app.

## 📜 Available Scripts

### `build-web.sh`
Build and optimize the web version of Konstruktor for deployment.

**Usage:**
```bash
./scripts/build-web.sh
```

**What it does:**
1. Cleans previous builds
2. Gets dependencies
3. Runs all tests
4. Builds optimized web app with:
   - CanvasKit renderer for better performance
   - Tree-shaken icons to reduce bundle size
5. Copies MIME type configuration files (`.htaccess`, `_headers`)
6. Creates `.nojekyll` file for GitHub Pages

**Output:** `build/web/` directory ready for deployment

---

### `serve-local.py`
Local development server with proper WASM MIME type configuration.

**Usage:**
```bash
python3 scripts/serve-local.py
```

**What it does:**
1. Serves the built web app from `build/web/`
2. Configures proper MIME types for all assets:
   - `.wasm` → `application/wasm` ✅ **CRITICAL**
   - `.js` → `application/javascript`
   - `.json` → `application/json`
   - `.css` → `text/css`
   - Fonts, images, and other assets
3. Adds security headers
4. Enables CORS for local development
5. Provides detailed logging

**Why this script?**
- ✅ Properly serves WASM files (avoids MIME type errors)
- ✅ Matches production environment configuration
- ✅ Better logging than simple HTTP servers
- ❌ DON'T use `python3 -m http.server` (wrong MIME types!)

**Default port:** 8080 (http://localhost:8080)

---

### `validate.sh`
Run code quality checks (if exists).

**Usage:**
```bash
./scripts/validate.sh
```

**What it does:**
1. Runs `dart format` on all Dart files
2. Runs `dart analyze` for static analysis
3. Runs all tests
4. Reports any issues

---

## 🚀 Quick Start Guide

### First Time Setup
```bash
# Get dependencies
flutter pub get

# Build the web app
./scripts/build-web.sh
```

### Development Workflow

#### 1. Make Changes
Edit your code in the `lib/` directory

#### 2. Test Locally
```bash
# Option 1: Use custom server (RECOMMENDED for WASM testing)
python3 scripts/serve-local.py

# Option 2: Use Flutter's dev server
flutter run -d chrome --web-port 8080
```

#### 3. Build for Production
```bash
./scripts/build-web.sh
```

#### 4. Deploy
Push to `main` branch (GitHub Actions handles deployment automatically)

---

## 🐛 Troubleshooting

### WASM MIME Type Error
**Error:**
```
Failed to execute 'compile' on 'WebAssembly': Incorrect response MIME type. Expected 'application/wasm'.
```

**Solution:**
```bash
# ✅ Use the custom server script
python3 scripts/serve-local.py

# NOT this:
# ❌ python3 -m http.server 8080
```

### Build Script Permission Denied
```bash
chmod +x scripts/build-web.sh
chmod +x scripts/serve-local.py
```

### Server Already Running
```bash
# Find and kill existing server
lsof -ti:8080 | xargs kill -9

# Or use a different port (edit serve-local.py)
```

---

## 📝 Notes

### MIME Type Configuration Files

The build script automatically copies these configuration files to the build output:

- **`_headers`**: Used by GitHub Pages, Netlify, and other platforms
  - Configures MIME types for all asset types
  - Sets security headers
  - Enables caching policies

- **`.htaccess`**: Used by Apache web servers
  - Configures MIME types for all asset types
  - Enables compression
  - Sets security headers
  - Handles SPA routing

These files are **critical** for proper WASM file serving in production!

### Local Development

For local development, `serve-local.py` simulates the production environment by:
1. Setting identical MIME types as production
2. Adding security headers
3. Enabling CORS for development

This ensures you catch MIME type issues **before** deployment!

---

## 🔗 Related Documentation

- **DEPLOYMENT.md**: Complete deployment guide with troubleshooting
- **README.md**: Project overview and setup instructions
- **memory-bank/**: Architecture and technical documentation

---

**Last Updated:** November 2024  
**Konstruktor Version:** 1.1.0

