import 'package:flutter/material.dart';
import 'package:konstruktor/ui/uikit.dart';

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
