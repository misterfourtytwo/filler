import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konstruktor/core/file_picker_service.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/features/canvas/presentation/canvas_bloc.dart';
import 'package:konstruktor/features/canvas/presentation/views/canvas_initial_view.dart';
import 'package:konstruktor/features/canvas/presentation/views/canvas_loading_view.dart';
import 'package:konstruktor/features/canvas/presentation/views/canvas_ready_view.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Canvas editor page providing pixel art creation interface.
///
/// Displays a grid-based canvas where users can paint pixels and
/// a color palette for selection. Includes save functionality and
/// uses BLoC pattern for state management.
class CanvasPage extends StatefulWidget {
  /// Creates a new canvas editor page.
  ///
  /// If [canvasId] is provided, loads existing canvas for editing.
  /// If [canvasId] is null, creates new canvas from preferences.
  const CanvasPage({super.key, this.canvasId});

  /// Optional ID of existing canvas to load for editing.
  final int? canvasId;

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  final _boundaryKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    AppLogger.navigation(
      'Canvas page initialized',
      data: {'canvasId': widget.canvasId, 'isEditing': widget.canvasId != null},
    );
    _initializeCanvas();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppLogger.navigation(
      'Canvas page dependencies changed - reinitializing',
      data: {'canvasId': widget.canvasId, 'isEditing': widget.canvasId != null},
    );
    _initializeCanvas();
  }

  /// Initializes canvas - either loads existing or creates new.
  void _initializeCanvas() {
    final bloc = context.read<CanvasBloc>();
    if (widget.canvasId != null) {
      AppLogger.canvas(
        'Loading existing canvas for editing',
        data: {'canvasId': widget.canvasId},
      );
      bloc.add(CanvasEvent.load(widget.canvasId!));
    } else {
      AppLogger.canvas('Creating new canvas from preferences');
      bloc.add(const CanvasEvent.init());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = DesignSystem.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            AppLogger.navigation('Canvas page back button pressed');
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
        ),
        actions: isMobile
            ? [
                // Only save button on mobile for minimal UI
                IconButton(
                  onPressed: () {
                    AppLogger.interaction('Save button pressed');
                    context.read<CanvasBloc>().add(
                      const CanvasEvent.save('Untitled'),
                    );
                  },
                  icon: const Icon(Icons.save_outlined),
                  tooltip: 'Save',
                ),
              ]
            : [
                // Both export and save on desktop
                IconButton(
                  onPressed: () => _exportCanvas(context),
                  icon: const Icon(Icons.download_outlined),
                  tooltip: 'Export',
                ),
                IconButton(
                  onPressed: () {
                    AppLogger.interaction('Save button pressed');
                    context.read<CanvasBloc>().add(
                      const CanvasEvent.save('Untitled'),
                    );
                  },
                  icon: const Icon(Icons.save_outlined),
                  tooltip: 'Save',
                ),
              ],
      ),
      body: BlocBuilder<CanvasBloc, CanvasState>(
        builder: (context, state) => state.map(
          initial: (_) => const CanvasInitialView(),
          loading: (_) => const CanvasLoadingView(),
          ready: (s) => CanvasReadyView(
            width: s.width,
            height: s.height,
            insets: s.insets,
            activePatternId: s.activePatternId,
            patternRotation: s.patternRotation,
            customPattern: s.customPattern,
            pixels: s.pixels,
            boundaryKey: _boundaryKey,
            patternPaintColor: s.patternPaintColor,
            canvasBackgroundColor: s.canvasBackgroundColor,
          ),
        ),
      ),
    );
  }

  /// Exports the current canvas as a PNG file.
  Future<void> _exportCanvas(BuildContext context) async {
    AppLogger.export(
      'Export button tapped on canvas page',
      data: {'canvasId': widget.canvasId},
    );

    // Check file permissions on macOS (only for native platforms)
    if (!kIsWeb) {
      final hasPermissions = await FilePickerService.hasFilePermissions();
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
    }

    try {
      final boundary =
          _boundaryKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        AppLogger.warning('Export failed: RepaintBoundary not found');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Export failed: Canvas not ready')),
          );
        }
        return;
      }

      // Show loading indicator
      if (!context.mounted) return;
      AppLogger.export('Showing export loading dialog');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      AppLogger.export('Capturing canvas as image', data: {'pixelRatio': 2.0});

      final image = await boundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        AppLogger.warning('Export failed: Could not convert image to bytes');
        if (context.mounted) {
          Navigator.of(context).pop(); // Close loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Export failed: Could not generate image'),
            ),
          );
        }
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

      if (context.mounted) Navigator.of(context).pop(); // Close loading dialog

      // Use file picker service to save the file
      final filename = 'canvas_${DateTime.now().millisecondsSinceEpoch}';
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
        Navigator.of(context).pop(); // Close loading dialog
        AppLogger.error(
          'Export failed with exception',
          error: e,
          data: {'canvasId': widget.canvasId},
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
  }
}

// Grid and palette widgets extracted to dedicated files.
