import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/features/gallery/presentation/gallery_bloc.dart';
import 'package:konstruktor/features/gallery/presentation/views/gallery_initial_view.dart';
import 'package:konstruktor/features/gallery/presentation/views/gallery_loaded_view.dart';
import 'package:konstruktor/features/gallery/presentation/views/gallery_loading_view.dart';

/// Gallery page displaying a grid of saved canvases.
///
/// This page shows all canvases stored in the database and allows users
/// to tap on them to view details, edit, or export. The page automatically
/// loads canvases when built and uses BLoC pattern for state management.
class GalleryPage extends StatelessWidget {
  /// Creates a new gallery page.
  const GalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    AppLogger.navigation('Gallery page built');
    context.read<GalleryBloc>().add(const GalleryEvent.load());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) => state.map<Widget>(
          initial: (_) => const GalleryInitialView(),
          loading: (_) => const GalleryLoadingView(),
          loaded: (s) => GalleryLoadedView(items: s.items),
        ),
      ),
    );
  }
}

// MiniCanvas and CanvasDetailPage moved to widgets and a dedicated page file.
