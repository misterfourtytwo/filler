import 'package:flutter/material.dart';
import 'package:konstruktor/ui/uikit.dart';

/// Loading state view shown while fetching preference data.
///
/// Displays loading indicator while the preferences BLoC
/// retrieves current settings from the database.
class PreferencesLoadingView extends StatelessWidget {
  /// Creates a loading preferences view.
  const PreferencesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator();
  }
}
