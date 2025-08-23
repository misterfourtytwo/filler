import 'dart:typed_data';

/// Stub implementation for non-web platforms.
class FilePickerServiceWeb {
  /// Stub method for non-web platforms.
  static Future<String?> downloadFile({
    required Uint8List bytes,
    required String filename,
  }) async {
    // This should never be called on non-web platforms
    throw UnsupportedError('Web download not supported on this platform');
  }
}
