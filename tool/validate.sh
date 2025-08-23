#!/usr/bin/env bash
set -euo pipefail
dart format .
flutter pub get
# Run analyzer but ignore info-level messages (only fail on warnings and errors)
flutter analyze --no-fatal-infos
# flutter test


