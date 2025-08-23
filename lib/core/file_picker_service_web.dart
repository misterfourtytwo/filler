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
      debugPrint(
        'Web download: Creating blob for $filename (${bytes.length} bytes)',
      );

      // Create a blob from the bytes with proper MIME type for PNG
      final blob = html.Blob([bytes], 'image/png');

      // Create a URL for the blob
      final url = html.Url.createObjectUrlFromBlob(blob);
      debugPrint('Web download: Created blob URL: $url');

      // Create a download link and add it to the DOM
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', filename)
        ..style.display = 'none'; // Hide the element

      // Add to DOM to ensure it's properly initialized
      html.document.body?.children.add(anchor);
      debugPrint('Web download: Added anchor to DOM');

      // Trigger the download
      anchor.click();
      debugPrint('Web download: Clicked anchor element');

      // Clean up: remove the element and revoke the URL
      Future.delayed(const Duration(milliseconds: 200), () {
        try {
          anchor.remove();
          html.Url.revokeObjectUrl(url);
          debugPrint('Web download: Cleaned up resources');
        } catch (e) {
          debugPrint('Web download: Error during cleanup: $e');
        }
      });

      return 'web_download_$filename';
    } on Exception catch (e) {
      debugPrint('Error downloading file on web: $e');
      return null;
    }
  }
}
