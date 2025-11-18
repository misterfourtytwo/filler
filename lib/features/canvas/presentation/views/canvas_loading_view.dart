import 'package:flutter/material.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Loading state view shown during canvas initialization.
///
/// Displayed while the canvas BLoC is setting up the initial
/// canvas state with user preferences and default values.
class CanvasLoadingView extends StatelessWidget {
  /// Creates a loading canvas view.
  const CanvasLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
