import 'package:filler/ui/uikit.dart';
import 'package:flutter/material.dart';

/// Initial state view displayed before canvas data loads.
///
/// Shows a loading indicator while the canvas BLoC fetches
/// user preferences and initializes the canvas dimensions.
class CanvasInitialView extends StatelessWidget {
  /// Creates an initial canvas view.
  const CanvasInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
