import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// Conditional import for web
import 'file_picker_service_web.dart'
    if (dart.library.io) 'file_picker_service_stub.dart';

/// Service for handling file picker operations across platforms.
///
/// Provides unified interface for file save dialogs and path selection.
/// Handles platform-specific differences between web, mobile, and desktop.
class FilePickerService {
  const FilePickerService._();

  /// Saves a file with the given bytes and suggested filename.
  ///
  /// On web, triggers a download. On mobile/desktop, shows a save dialog.
  /// Returns the saved file path or null if cancelled/error.
  static Future<String?> saveFile({
    required Uint8List bytes,
    required String suggestedName,
    String? suggestedExtension,
  }) async {
    try {
      if (kIsWeb) {
        // Web: Use file_picker to trigger download
        return await _saveFileWeb(bytes, suggestedName, suggestedExtension);
      } else {
        // Mobile/Desktop: Use file_picker to show save dialog
        return await _saveFileNative(bytes, suggestedName, suggestedExtension);
      }
    } on Exception catch (e) {
      debugPrint('Error saving file: $e');
      return null;
    }
  }

  /// Web implementation using browser download.
  static Future<String?> _saveFileWeb(
    Uint8List bytes,
    String suggestedName,
    String? suggestedExtension,
  ) async {
    final extension = suggestedExtension ?? 'png';
    final filename = '$suggestedName.$extension';

    return await FilePickerServiceWeb.downloadFile(
      bytes: bytes,
      filename: filename,
    );
  }

  /// Native implementation using file_picker save dialog.
  static Future<String?> _saveFileNative(
    Uint8List bytes,
    String suggestedName,
    String? suggestedExtension,
  ) async {
    final extension = suggestedExtension ?? 'png';
    final filename = '$suggestedName.$extension';

    try {
      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Canvas',
        fileName: filename,
        type: FileType.custom,
        allowedExtensions: [extension],
        lockParentWindow: true, // Prevent dialog from being hidden behind app
      );

      if (path != null) {
        try {
          final file = File(path);
          await file.writeAsBytes(bytes);
          debugPrint('File saved successfully to: $path');
          return path;
        } on FileSystemException catch (e) {
          debugPrint('Failed to write file: $e');
          // Try to provide more specific error information
          if (e.message.contains('Permission denied')) {
            throw Exception(
              'Permission denied. Please check file permissions or try a different location.',
            );
          } else if (e.message.contains('No space left')) {
            throw Exception(
              'No space left on device. Please free up some space and try again.',
            );
          } else {
            throw Exception('Failed to save file: ${e.message}');
          }
        }
      }
      return null;
    } on PlatformException catch (e) {
      debugPrint('Platform exception during file save: $e');
      if (e.code == 'user_cancelled') {
        return null; // User cancelled, not an error
      } else if (e.code == 'permission_denied') {
        throw Exception(
          'Permission denied. Please grant file access permissions in System Preferences > Security & Privacy.',
        );
      } else {
        throw Exception('File save failed: ${e.message}');
      }
    } on Exception catch (e) {
      debugPrint('Unexpected error during file save: $e');
      rethrow;
    }
  }

  /// Gets a temporary directory path for saving files.
  ///
  /// Returns the app's temporary directory path.
  static Future<String> getTemporaryDirectory() async {
    final dir = await path_provider.getTemporaryDirectory();
    return dir.path;
  }

  /// Checks if the app has necessary permissions for file operations.
  ///
  /// On macOS, this checks if the app can access user-selected directories.
  /// Returns true if permissions are available, false otherwise.
  static Future<bool> hasFilePermissions() async {
    if (!Platform.isMacOS) {
      return true; // Not needed on other platforms
    }

    try {
      // Try to access a common directory to test permissions
      final downloadsDir = await path_provider.getDownloadsDirectory();
      if (downloadsDir != null) {
        final testFile = File('${downloadsDir.path}/test_permission.tmp');
        await testFile.writeAsString('test');
        await testFile.delete();
        return true;
      }
      return false;
    } on Exception catch (e) {
      debugPrint('Permission check failed: $e');
      return false;
    }
  }

  /// Shows a permission request dialog for macOS.
  ///
  /// This is a helper method to guide users on how to grant permissions.
  static Future<void> requestFilePermissions() async {
    if (!Platform.isMacOS) {
      return; // Not needed on other platforms
    }

    // On macOS, we can't programmatically request permissions,
    // but we can show a dialog explaining how to grant them
    debugPrint(
      'File permissions needed. Please grant access in System Preferences > Security & Privacy > Privacy > Files and Folders.',
    );
  }
}
