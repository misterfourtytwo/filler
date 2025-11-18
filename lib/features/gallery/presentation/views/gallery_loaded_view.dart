import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/features/gallery/presentation/canvas_detail_page.dart';
import 'package:konstruktor/features/gallery/presentation/gallery_bloc.dart';
import 'package:konstruktor/features/gallery/presentation/widgets/mini_canvas.dart';
import 'package:konstruktor/ui/design_system.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Loaded state view displaying saved canvas thumbnails.
///
/// Shows a grid of saved canvases as interactive thumbnails.
/// Displays empty state when no canvases exist, otherwise
/// navigates to detail page when tapped.
class GalleryLoadedView extends StatelessWidget {
  /// Creates a loaded gallery view with canvas items.
  const GalleryLoadedView({super.key, required this.items});

  /// List of saved canvas items to display.
  final List<GalleryItem> items;

  @override
  Widget build(BuildContext context) {
    AppLogger.navigation(
      'Gallery loaded view built',
      data: {'itemCount': items.length, 'isEmpty': items.isEmpty},
    );

    if (items.isEmpty) {
      return const EmptyState(
        message: 'No canvases yet.\nCreate one to get started!',
        icon: Icons.photo_library_outlined,
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(DesignSystem.spaceMd),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: DesignSystem.spaceSm,
        mainAxisSpacing: DesignSystem.spaceSm,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Stack(
          children: [
            InkWell(
              onTap: () {
                AppLogger.navigation(
                  'Gallery item tapped',
                  data: {
                    'canvasId': item.id,
                    'dimensions': '${item.width}x${item.height}',
                    'index': index,
                  },
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CanvasDetailPage(item: item),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
              child: MiniCanvas(item: item),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => _showDeleteDialog(context, item),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, GalleryItem item) {
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
              context.read<GalleryBloc>().add(GalleryEvent.delete(item.id));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
