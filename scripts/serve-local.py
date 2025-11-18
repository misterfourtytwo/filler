#!/usr/bin/env python3
"""
Konstruktor Local Web Server
Serves the web app with proper MIME types for WASM files
"""

import http.server
import socketserver
import os
import sys
from pathlib import Path

# Port to serve on
PORT = 8099

# Directory to serve (build/web)
SCRIPT_DIR = Path(__file__).parent
BUILD_DIR = SCRIPT_DIR.parent / "build" / "web"


class WASmHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    """Custom handler that sets proper MIME types for WASM files"""
    
    def __init__(self, *args, **kwargs):
        # Set custom MIME types
        self.extensions_map.update({
            '.wasm': 'application/wasm',
            '.js': 'application/javascript',
            '.json': 'application/json',
            '.css': 'text/css',
            '.html': 'text/html',
            '.png': 'image/png',
            '.ico': 'image/x-icon',
            '.svg': 'image/svg+xml',
            '.woff': 'font/woff',
            '.woff2': 'font/woff2',
            '.ttf': 'font/ttf',
            '.otf': 'font/otf',
        })
        super().__init__(*args, **kwargs)
    
    def end_headers(self):
        # Add security headers
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('X-XSS-Protection', '1; mode=block')
        self.send_header('Referrer-Policy', 'strict-origin-when-cross-origin')
        
        # Add CORS headers for local development
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        
        super().end_headers()
    
    def send_head(self):
        """Override send_head to handle missing files gracefully"""
        try:
            return super().send_head()
        except FileNotFoundError:
            # Silently return 404 for missing files (like .map files)
            self.send_error(404, "File not found")
            return None
    
    def log_error(self, format, *args):
        """Suppress error logs for 404s on .map files and other expected missing files"""
        if len(args) >= 2 and args[1] == '404':
            path = args[0] if args else ''
            # Only log 404s for files that should exist (not .map files)
            if not (isinstance(path, str) and path.endswith('.map')):
                super().log_error(format, *args)
        else:
            super().log_error(format, *args)
    
    def log_message(self, format, *args):
        # Custom logging with MIME type info
        if len(args) >= 2:
            path = args[0]
            status = args[1]
            # Don't log 404s for .map files (they're expected to be missing)
            if status == '404' and isinstance(path, str) and path.endswith('.map'):
                return
            if isinstance(path, str) and path.endswith('.wasm'):
                print(f"[WASM] {status} - {path}")
            else:
                print(f"[{status}] {path}")
        else:
            super().log_message(format, *args)


def main():
    # Check if build directory exists
    if not BUILD_DIR.exists():
        print(f"❌ Error: Build directory not found at {BUILD_DIR}")
        print("   Please run: flutter build web")
        sys.exit(1)
    
    # Change to build directory
    os.chdir(BUILD_DIR)
    
    # Create server
    with socketserver.TCPServer(("", PORT), WASmHTTPRequestHandler) as httpd:
        print(f"🚀 Konstruktor Web Server")
        print(f"📁 Serving from: {BUILD_DIR}")
        print(f"🌐 Server running at: http://localhost:{PORT}")
        print(f"✨ WASM MIME types properly configured")
        print(f"\n   Press Ctrl+C to stop\n")
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n✅ Server stopped")
            sys.exit(0)


if __name__ == "__main__":
    main()

