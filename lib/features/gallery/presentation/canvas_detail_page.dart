import 'dart:ui' as ui;

import 'package:filler/core/file_picker_service.dart';
import 'package:filler/core/logging.dart';
import 'package:filler/features/canvas/presentation/canvas_page.dart';
import 'package:filler/features/canvas/presentation/widgets/canvas_grid.dart';
import 'package:filler/features/gallery/presentation/gallery_bloc.dart';
import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Detail page for viewing and interacting with a saved canvas.
///
/// Shows a full-size view of the canvas with options to edit
/// (navigate to canvas editor) or export as PNG file. Uses
/// RepaintBoundary for export functionality.
class CanvasDetailPage extends StatefulWidget {
  /// Creates a detail page for the given canvas item.
  const CanvasDetailPage({super.key, required this.item});

  /// The canvas item to display and interact with.
  final GalleryItem item;

  @override
  State<CanvasDetailPage> createState() => _CanvasDetailPageState();
}

class _CanvasDetailPageState extends State<CanvasDetailPage> {
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    // Colors are now stored in the canvas model itself
    // This method is kept for future use if needed
  }

  /// Builds a centered canvas grid for display.
  Widget _buildCanvasGrid(BuildContext context, GlobalKey boundaryKey) {
    return CanvasGrid(
      width: widget.item.width,
      height: widget.item.height,
      insets: widget.item.insets,
      pixels: widget.item.pixels,
      patternRotation: 0.0, // No rotation for display
      customPattern: null, // No custom pattern for display
      onTap: (_) {}, // No interaction in detail view
      boundaryKey: boundaryKey,
      patternPaintColor: widget.item.patternPaintColor,
      canvasBackgroundColor: widget.item.canvasBackgroundColor,
      showBorders: false, // No borders for cleaner display
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLogger.navigation(
      'Canvas detail page built',
      data: {
        'canvasId': widget.item.id,
        'dimensions': '${widget.item.width}x${widget.item.height}',
        'insets': widget.item.insets,
        'pixelCount': widget.item.pixels.length,
      },
    );

    final boundaryKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canvas Showcase'),
        leading: const BackButton(),
        actions: [
          TextButton(
            onPressed: () {
              AppLogger.navigation(
                'Edit button tapped on canvas detail',
                data: {
                  'canvasId': widget.item.id,
                  'canvasTitle': 'Canvas ${widget.item.id}',
                },
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CanvasPage(canvasId: widget.item.id),
                ),
              );
            },
            child: const Text('edit'),
          ),
          TextButton(
            onPressed: () {
              _showDeleteDialog(context);
            },
            child: const Text('delete'),
          ),
          TextButton(
            onPressed: () async {
              AppLogger.export(
                'Export button tapped',
                data: {
                  'canvasId': widget.item.id,
                  'dimensions': '${widget.item.width}x${widget.item.height}',
                },
              );

              // Check file permissions on macOS
              final hasPermissions =
                  await FilePickerService.hasFilePermissions();
              if (!hasPermissions) {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('File Access Permission Required'),
                      content: const Text(
                        'This app needs permission to save files. Please grant access in:\n\n'
                        'System Preferences > Security & Privacy > Privacy > Files and Folders\n\n'
                        'Then try exporting again.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
                return;
              }

              try {
                final boundary =
                    boundaryKey.currentContext?.findRenderObject()
                        as RenderRepaintBoundary?;
                if (boundary == null) {
                  AppLogger.warning('Export failed: RepaintBoundary not found');
                  return;
                }

                // Show loading indicator
                if (!context.mounted) return;
                AppLogger.export('Showing export loading dialog');
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );

                AppLogger.export(
                  'Capturing canvas as image',
                  data: {'pixelRatio': 2.0},
                );

                final image = await boundary.toImage(pixelRatio: 2.0);
                final byteData = await image.toByteData(
                  format: ui.ImageByteFormat.png,
                );
                if (byteData == null) {
                  AppLogger.warning(
                    'Export failed: Could not convert image to bytes',
                  );
                  if (context.mounted) Navigator.of(context).pop();
                  return;
                }
                final pngBytes = byteData.buffer.asUint8List();

                AppLogger.export(
                  'Image captured successfully',
                  data: {
                    'imageSizeBytes': pngBytes.length,
                    'imageDimensions': '${image.width}x${image.height}',
                  },
                );

                if (context.mounted) Navigator.of(context).pop();

                // Use file picker service to save the file
                final filename =
                    'canvas_${widget.item.id}_${DateTime.now().millisecondsSinceEpoch}';
                final savedPath = await FilePickerService.saveFile(
                  bytes: pngBytes,
                  suggestedName: filename,
                  suggestedExtension: 'png',
                );

                if (savedPath != null) {
                  AppLogger.export(
                    'File saved successfully',
                    data: {'path': savedPath, 'fileSize': pngBytes.length},
                  );

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Canvas exported successfully to: ${savedPath.split('/').last}',
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          textColor: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  }
                } else {
                  AppLogger.export('File save cancelled or failed');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'File save was cancelled or failed. Please try again.',
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }
                }
              } on Exception catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  AppLogger.error(
                    'Export failed with exception',
                    error: e,
                    data: {'canvasId': widget.item.id},
                  );

                  // Show user-friendly error message
                  String errorMessage = 'Export failed';
                  if (e.toString().contains('Permission denied')) {
                    errorMessage =
                        'Permission denied. Please check file access permissions in System Preferences > Security & Privacy.';
                  } else if (e.toString().contains('No space left')) {
                    errorMessage =
                        'No space left on device. Please free up some space and try again.';
                  } else if (e.toString().contains('user_cancelled')) {
                    errorMessage = 'Export was cancelled.';
                  } else {
                    errorMessage = 'Export failed: ${e.toString()}';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        textColor: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                }
              }
            },
            child: const Text('export'),
          ),
          const SizedBox(width: DesignSystem.spaceSm),
        ],
      ),
      body: Center(
        child: RepaintBoundary(
          key: boundaryKey,
          child: _buildCanvasGrid(context, boundaryKey),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Canvas'),
        content: const Text('Are you sure you want to delete this canvas?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Close detail page
              // Note: We need to access the gallery bloc from here
              // For now, we'll just close the page and let the user refresh
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
