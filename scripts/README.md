# Konstruktor Build & Development Scripts

This directory contains scripts for building, testing, and serving the Konstruktor app.

## 📜 Available Scripts

### `build-web.sh`
Build and optimize the web version of Konstruktor for deployment.

**Usage:**
```bash
# Default: GitHub Pages subdirectory (/konstruktor/)
./scripts/build-web.sh

# Custom base-href for root domain
./scripts/build-web.sh /

# Custom base-href for different subdirectory
./scripts/build-web.sh /my-app/
```

**Parameters:**
- `$1` (optional): Base href path (defaults to `/konstruktor/`)
  - Use `/konstruktor/` for GitHub Pages at `username.github.io/konstruktor/`
  - Use `/` for root domain deployment
  - Must start and end with `/`

**What it does:**
1. Parses base-href parameter (defaults to `/konstruktor/`)
2. Cleans previous builds
3. Gets dependencies
4. Runs all tests
5. Builds optimized web app with:
   - Specified base-href for correct asset paths
   - CanvasKit renderer for better performance
   - Tree-shaken icons to reduce bundle size
6. Copies MIME type configuration files (`.htaccess`, `_headers`)
7. Creates `.nojekyll` file for GitHub Pages

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
# Option 1: Use Flutter's dev server (BEST for development)
flutter run -d chrome --web-port 8080

# Option 2: Build and test with local server (for production testing)
./scripts/build-web.sh /        # Build with root base-href for local testing
python3 scripts/serve-local.py  # Serve at http://localhost:8099
```

**Important Notes:**
- When testing locally, use `/` as base-href: `./scripts/build-web.sh /`
- The default `/konstruktor/` base-href is for GitHub Pages deployment only
- For production testing, build with `/konstruktor/` then deploy to test server

#### 3. Build for Production
```bash
# For GitHub Pages at username.github.io/konstruktor/
./scripts/build-web.sh /konstruktor/

# For root domain deployment
./scripts/build-web.sh /
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

