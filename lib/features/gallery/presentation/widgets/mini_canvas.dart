import 'package:filler/features/canvas/domain/canvas_pattern.dart';
import 'package:filler/features/gallery/presentation/gallery_bloc.dart';
import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// Miniature canvas widget for gallery thumbnails.
///
/// Renders a small version of the canvas grid showing the pixel
/// art in a compact format suitable for gallery grid views.
/// Uses the same GridView structure as the main canvas.
class MiniCanvas extends StatelessWidget {
  /// Creates a mini canvas for the given gallery item.
  const MiniCanvas({super.key, required this.item});

  /// The gallery item containing canvas data to render.
  final GalleryItem item;
  @override
  Widget build(BuildContext context) {
    const double pixelSize = DesignSystem.thumbnailPixelSize; // Fixed size
    final double spacing = item.insets * 0.5; // Scale down spacing

    // Calculate total size needed for the thumbnail
    final double totalWidth =
        (item.width * pixelSize) + ((item.width - 1) * spacing);
    final double totalHeight =
        (item.height * pixelSize) + ((item.height - 1) * spacing);

    return Center(
      child: SizedBox(
        width: totalWidth,
        height: totalHeight,
        child: Container(
          color: item.canvasBackgroundColor,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: item.width,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemCount: item.pixels.length,
            itemBuilder: (context, i) {
              final pixelData = item.pixels[i];
              final pattern = CanvasPatternExtension.fromValue(
                pixelData.pattern,
              );
              return Container(
                width: pixelSize,
                height: pixelSize,
                child: CustomPaint(
                  painter: PatternPainter(
                    pattern,
                    rotation: pixelData.rotation,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
