import 'package:filler/ui/uikit.dart';
import 'package:flutter/material.dart';

/// Initial state view for gallery before loading begins.
///
/// Shows a loading indicator while waiting for the gallery
/// BLoC to start fetching saved canvas data.
class GalleryInitialView extends StatelessWidget {
  /// Creates an initial gallery view.
  const GalleryInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
