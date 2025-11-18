import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/features/canvas/presentation/canvas_page.dart';
import 'package:konstruktor/features/gallery/presentation/gallery_page.dart';
import 'package:konstruktor/features/prefs/presentation/preferences_page.dart';
import 'package:konstruktor/ui/design_system.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Home page providing navigation to main app features.
///
/// Central hub with buttons to access canvas editor, gallery
/// of saved canvases, and preferences configuration.
class HomePage extends StatefulWidget {
  /// Creates the main home page.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = DesignSystem.isDesktop(context);

    AppLogger.navigation(
      'Home page built',
      data: {
        'layoutType': isDesktop ? 'desktop' : 'mobile',
        'screenSize':
            '${MediaQuery.sizeOf(context).width}x${MediaQuery.sizeOf(context).height}',
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App header
            Container(
              padding: const EdgeInsets.all(DesignSystem.spaceLg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.brush_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: DesignSystem.spaceSm),
                  Text(
                    'Filler',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Page content
            Expanded(
              child: Center(
                child: isDesktop
                    ? _buildDesktopLayout(context)
                    : _buildMobileLayout(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Desktop layout with larger buttons and wider spacing.
  Widget _buildDesktopLayout(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Filler',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0,
            color: scheme.onSurface,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXs),
        Text(
          'Pixel Art Studio',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: scheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXxl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionTile(
              title: 'New Canvas',
              subtitle: 'Create pixel art',
              icon: Icons.add_box,
              onTap: () {
                HapticFeedback.lightImpact();
                AppLogger.navigation('New Canvas tile tapped (desktop)');
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const CanvasPage()));
              },
            ),
            const SizedBox(width: DesignSystem.spaceXl),
            ActionTile(
              title: 'Gallery',
              subtitle: 'View saved canvases',
              icon: Icons.photo_library,
              onTap: () {
                HapticFeedback.lightImpact();
                AppLogger.navigation('Gallery tile tapped (desktop)');
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const GalleryPage()));
              },
            ),
            const SizedBox(width: DesignSystem.spaceXl),
            ActionTile(
              title: 'Preferences',
              subtitle: 'Configure defaults',
              icon: Icons.settings,
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PreferencesPage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  /// Mobile layout with simple button list.
  Widget _buildMobileLayout(BuildContext context) {
    return Wrap(
      spacing: DesignSystem.spaceLg,
      runSpacing: DesignSystem.spaceLg,
      children: [
        ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const CanvasPage()));
          },
          child: const Text('New Canvas'),
        ),
        ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const GalleryPage()));
          },
          child: const Text('Gallery'),
        ),
        ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const PreferencesPage()));
          },
          child: const Text('Preferences'),
        ),
      ],
    );
  }
}
