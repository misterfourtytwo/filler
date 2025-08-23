import 'dart:html' as html;
import 'package:flutter/foundation.dart';

/// Web-specific implementation for file download.
class FilePickerServiceWeb {
  /// Downloads a file on web platform.
  static Future<String?> downloadFile({
    required Uint8List bytes,
    required String filename,
  }) async {
    try {
      // Create a blob from the bytes
      final blob = html.Blob([bytes]);

      // Create a URL for the blob
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a download link
      html.AnchorElement(href: url)
        ..setAttribute('download', filename)
        ..click();

      // Clean up the URL after a short delay
      Future.delayed(const Duration(milliseconds: 100), () {
        html.Url.revokeObjectUrl(url);
      });

      return 'web_download_$filename';
    } on Exception catch (e) {
      debugPrint('Error downloading file on web: $e');
      return null;
    }
  }
}
