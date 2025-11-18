import 'package:flutter/material.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Loading state view shown while fetching saved canvases.
///
/// Displays a loading indicator while the gallery BLoC
/// retrieves and processes canvas data from the repository.
class GalleryLoadingView extends StatelessWidget {
  /// Creates a loading gallery view.
  const GalleryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
