import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konstruktor/features/canvas/domain/canvas_pattern.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Sleek and minimalistic pattern palette with Apple Storefront-inspired design.
///
/// Features clean grid layouts, refined typography, and elegant interactions
/// that create a premium, sophisticated pattern selection experience.
class PatternPalette extends StatefulWidget {
  /// Creates a sleek pattern palette.
  const PatternPalette({
    super.key,
    required this.patterns,
    required this.selectedPattern,
    required this.onPatternSelected,
  });

  /// Available patterns to display.
  final List<CanvasPattern> patterns;

  /// Currently selected pattern.
  final CanvasPattern selectedPattern;

  /// Callback when a pattern is selected.
  final ValueChanged<CanvasPattern> onPatternSelected;

  @override
  State<PatternPalette> createState() => _PatternPaletteState();
}

class _PatternPaletteState extends State<PatternPalette> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceLg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLg),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: DesignSystem.strokeUltraThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: DesignSystem.spaceLg),
          _buildPatternGrid(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(DesignSystem.spaceSm),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
          ),
          child: Icon(
            Icons.palette_outlined,
            color: colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: DesignSystem.spaceMd),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patterns',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
              Text(
                'Choose your pattern',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPatternGrid(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width > 600 ? 6 : 4;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: DesignSystem.spaceMd,
        mainAxisSpacing: DesignSystem.spaceMd,
      ),
      itemCount: widget.patterns.length,
      itemBuilder: (context, index) {
        final pattern = widget.patterns[index];
        final isSelected = pattern == widget.selectedPattern;

        return _buildPatternSwatch(
          context,
          pattern: pattern,
          isSelected: isSelected,
        );
      },
    );
  }

  Widget _buildPatternSwatch(
    BuildContext context, {
    required CanvasPattern pattern,
    required bool isSelected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          widget.onPatternSelected(pattern);
        },
        borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
        onTapDown: (_) => HapticFeedback.lightImpact(),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primaryContainer
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.1),
              width: isSelected
                  ? DesignSystem.strokeMedium
                  : DesignSystem.strokeUltraThin,
            ),
          ),
          child: Stack(
            children: [
              // Pattern display
              Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
                    child: CustomPaint(
                      painter: PatternPainter(
                        pattern,
                        paintColor: colorScheme.primary,
                      ),
                      size: const Size(32, 32),
                    ),
                  ),
                ),
              ),

              // Selection indicator
              if (isSelected)
                Positioned(
                  top: DesignSystem.spaceXs,
                  right: DesignSystem.spaceXs,
                  child: Container(
                    padding: const EdgeInsets.all(DesignSystem.spaceXs),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                        DesignSystem.radiusSm,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: colorScheme.onPrimary,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
