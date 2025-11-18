import 'package:flutter/material.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Initial state view for preferences before data loads.
///
/// Shows loading indicator while waiting for the preferences
/// BLoC to fetch current settings from the repository.
class PreferencesInitialView extends StatelessWidget {
  /// Creates an initial preferences view.
  const PreferencesInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
