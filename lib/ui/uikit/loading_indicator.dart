import 'package:flutter/material.dart';

/// Centered loading spinner widget for async operations.
///
/// Simple wrapper around CircularProgressIndicator that centers
/// it within available space. Used in loading states throughout
/// the app for consistency.
class LoadingIndicator extends StatelessWidget {
  /// Creates a centered loading indicator.
  const LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 36,
        height: 36,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
