import 'package:filler/core/logging.dart';
import 'package:filler/features/canvas/presentation/canvas_page.dart';
import 'package:filler/features/gallery/presentation/gallery_page.dart';
import 'package:filler/features/prefs/presentation/preferences_page.dart';
import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// Main navigation component that adapts to screen size.
///
/// Uses NavigationRail for desktop/web and bottom navigation for mobile.
/// Provides consistent navigation across all app features.
class AppNavigation extends StatefulWidget {
  /// Creates the main navigation component.
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    _HomeView(),
    _GalleryView(),
    _PreferencesView(),
  ];

  static const List<NavigationRailDestination> _railDestinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.photo_library_outlined),
      selectedIcon: Icon(Icons.photo_library),
      label: Text('Gallery'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: Text('Settings'),
    ),
  ];

  static const List<BottomNavigationBarItem> _bottomDestinations = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_library_outlined),
      activeIcon: Icon(Icons.photo_library),
      label: 'Gallery',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      activeIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = DesignSystem.isDesktop(context);

    AppLogger.navigation(
      'App navigation built',
      data: {
        'layoutType': isDesktop ? 'desktop' : 'mobile',
        'selectedIndex': _selectedIndex,
      },
    );

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                AppLogger.navigation(
                  'Navigation rail destination selected',
                  data: {'index': index},
                );
              },
              labelType: NavigationRailLabelType.none,
              destinations: _railDestinations,
              minExtendedWidth: 200,
              extended: true,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            AppLogger.navigation(
              'Bottom navigation destination selected',
              data: {'index': index},
            );
          },
          items: _bottomDestinations,
          type: BottomNavigationBarType.fixed,
        ),
      );
    }
  }
}

/// Home view with welcome content and new canvas button.
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final isDesktop = DesignSystem.isDesktop(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo and title
            Icon(
              Icons.brush_outlined,
              size: isDesktop ? 64 : 48,
              color: scheme.primary,
            ),
            const SizedBox(height: DesignSystem.spaceLg),
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

            // New canvas button
            ElevatedButton.icon(
              onPressed: () {
                AppLogger.navigation('New canvas button pressed');
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const CanvasPage()));
              },
              icon: const Icon(Icons.add_box),
              label: const Text('Create New Canvas'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignSystem.spaceXl,
                  vertical: DesignSystem.spaceLg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Gallery view wrapper.
class _GalleryView extends StatelessWidget {
  const _GalleryView();

  @override
  Widget build(BuildContext context) {
    return const GalleryPage();
  }
}

/// Preferences view wrapper.
class _PreferencesView extends StatelessWidget {
  const _PreferencesView();

  @override
  Widget build(BuildContext context) {
    return const PreferencesPage();
  }
}
