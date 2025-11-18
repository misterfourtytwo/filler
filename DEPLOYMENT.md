# Konstruktor App - GitHub Pages Deployment Guide

This guide provides step-by-step instructions for deploying the Konstruktor pixel canvas editor to GitHub Pages.

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.24.0 or higher)
- Git repository on GitHub
- GitHub account with Pages enabled

### 1. Repository Configuration

#### Step 1: Update Repository Settings
1. Go to your GitHub repository
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **Deploy from a branch**
4. Choose **gh-pages** branch and **/(root)** folder
5. Click **Save**

#### Step 2: Enable GitHub Actions
1. Go to **Settings** → **Actions** → **General**
2. Ensure **Actions permissions** is set to **Allow all actions and reusable workflows**
3. Click **Save**

### 2. Local Build and Test

#### Build the Web App
```bash
# Run the build script (defaults to /konstruktor/ base-href for GitHub Pages)
./scripts/build-web.sh

# Or specify custom base-href:
./scripts/build-web.sh /konstruktor/    # GitHub Pages subdirectory
./scripts/build-web.sh /                # Root domain

# Or manually:
flutter clean
flutter pub get
flutter test
flutter build web --release --base-href=/konstruktor/
```

#### Test Locally
```bash
# RECOMMENDED: Use the custom server with proper WASM MIME types
python3 scripts/serve-local.py

# ALTERNATIVE: Use Flutter's built-in server
flutter run -d chrome --web-port 8080

# NOTE: DO NOT use simple HTTP servers like 'python3 -m http.server'
# They don't serve WASM files with correct MIME types and will fail
```

### 3. Deployment

#### Automatic Deployment (Recommended)
1. Push your changes to the `main` branch
2. GitHub Actions will automatically:
   - Build the Flutter web app
   - Run tests
   - Deploy to GitHub Pages
3. Your app will be available at: `https://your-username.github.io/konstruktor/`

#### Manual Deployment
```bash
# Build the app
./scripts/build-web.sh

# Deploy using gh-pages package (if installed)
npx gh-pages -d build/web
```

## 🔧 Configuration Files

### GitHub Actions Workflow
- **File**: `.github/workflows/deploy.yml`
- **Purpose**: Automated build and deployment
- **Triggers**: Push to main branch, pull requests

### Web Configuration
- **index.html**: Optimized for SEO and performance with WASM preloading
- **manifest.json**: PWA configuration
- **404.html**: Custom 404 page for client-side routing
- **_headers**: GitHub Pages MIME type configuration (especially for WASM)
- **.htaccess**: Apache server MIME type configuration
- **serve-local.py**: Local development server with proper MIME types

### Build Script
- **File**: `scripts/build-web.sh`
- **Purpose**: Local build optimization
- **Features**: Clean build, test execution, size optimization

## 🎯 Optimization Features

### Performance Optimizations
- **CanvasKit Renderer**: Default renderer for better performance (Flutter 3.35+)
- **Tree Shaking**: Removes unused code and icons
- **Resource Preloading**: Critical resources loaded early
- **Compression**: Optimized asset delivery

### SEO Optimizations
- **Meta Tags**: Open Graph, Twitter Cards
- **Structured Data**: Rich snippets support
- **Sitemap**: Automatic generation (if needed)

### PWA Features
- **Offline Support**: Service worker ready
- **App-like Experience**: Standalone display mode
- **Install Prompt**: Add to home screen capability

## 🐛 Troubleshooting

### Common Issues

#### WebAssembly MIME Type Errors
**Error**: `Failed to execute 'compile' on 'WebAssembly': Incorrect response MIME type. Expected 'application/wasm'.`

**Solution**:
```bash
# ✅ CORRECT: Use the custom local server
python3 scripts/serve-local.py

# ✅ CORRECT: Use Flutter's built-in server
flutter run -d chrome --web-port 8080

# ❌ WRONG: Don't use simple HTTP servers
# python3 -m http.server 8080  # This will fail!
```

**Why This Happens**:
- WASM files must be served with `Content-Type: application/wasm`
- Simple HTTP servers don't set proper MIME types
- The custom `serve-local.py` script properly configures all MIME types
- GitHub Pages uses `_headers` and `.htaccess` files (included in build)

**Verification**:
```bash
# Check MIME type being served (should show "application/wasm")
curl -I http://localhost:8080/sql-wasm.wasm | grep -i content-type
```

#### Build Failures
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web --release

# With optimizations (same as build script)
flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true --tree-shake-icons
```

#### Deployment Issues
1. Check GitHub Actions logs
2. Verify repository permissions
3. Ensure gh-pages branch exists
4. Verify MIME type configuration files are deployed

#### Routing Issues
- Custom 404 page handles client-side routing
- **Base href configuration**: The app uses `--base-href=/konstruktor/` for GitHub Pages
- If deploying to root domain, use: `./scripts/build-web.sh /`
- If deploying to different subdirectory, use: `./scripts/build-web.sh /your-path/`

#### Asset Path Issues
**Problem**: Assets not loading (404 errors on images, JS, CSS files)

**Cause**: Incorrect base-href configuration
- GitHub Pages subdirectory requires: `--base-href=/konstruktor/`
- Root domain requires: `--base-href=/`

**Solution**: The build script and GitHub Actions now automatically set the correct base-href

### Performance Monitoring
- Use Chrome DevTools for performance analysis
- Monitor Core Web Vitals
- Check bundle size optimization

## 📱 Platform Support

### Web Browser Compatibility
- **Chrome**: Full support (recommended)
- **Firefox**: Full support
- **Safari**: Full support
- **Edge**: Full support

### Mobile Support
- **iOS Safari**: Full support
- **Android Chrome**: Full support
- **PWA Installation**: Supported on all platforms

## 🔄 Continuous Deployment

### Workflow
1. **Development**: Work on feature branches
2. **Testing**: Run tests locally and in CI
3. **Merge**: Pull request to main branch
4. **Deploy**: Automatic deployment via GitHub Actions
5. **Monitor**: Check deployment status and performance

### Environment Variables
- `GITHUB_TOKEN`: Automatically provided by GitHub
- `FLUTTER_WEB_USE_SKIA`: Enabled for better performance
- `FLUTTER_WEB_USE_SKIA_RENDERER`: Enabled for CanvasKit

## 📊 Analytics and Monitoring

### Recommended Tools
- **Google Analytics**: User behavior tracking
- **Sentry**: Error monitoring
- **Lighthouse**: Performance auditing

### Setup Instructions
1. Add analytics code to `web/index.html`
2. Configure error reporting
3. Set up performance monitoring

## 🔒 Security Considerations

### Content Security Policy
- Configure CSP headers if needed
- Validate external resources
- Secure database connections

### Data Privacy
- Review data collection practices
- Ensure GDPR compliance
- Implement privacy controls

## 📈 Scaling Considerations

### Performance Optimization
- **Code Splitting**: Implement lazy loading
- **Caching**: Optimize asset caching
- **CDN**: Consider content delivery network

### Monitoring
- **Uptime Monitoring**: Set up alerts
- **Performance Tracking**: Monitor Core Web Vitals
- **Error Tracking**: Monitor application errors

---

## 🎉 Success Checklist

- [ ] Repository configured for GitHub Pages
- [ ] GitHub Actions workflow working
- [ ] Local build successful
- [ ] Tests passing
- [ ] App accessible at GitHub Pages URL
- [ ] PWA features working
- [ ] Performance optimized
- [ ] SEO configured
- [ ] Error handling in place
- [ ] Monitoring set up

## 📞 Support

For deployment issues:
1. Check GitHub Actions logs
2. Review this documentation
3. Test locally first
4. Verify configuration files

---

**Last Updated**: November 2024  
**Version**: 1.1.0  
**Project**: Konstruktor (formerly Konstruktor)
