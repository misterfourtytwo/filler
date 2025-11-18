import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konstruktor/features/canvas/domain/custom_pattern.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Editor widget for creating and modifying custom patterns.
///
/// Provides a grid interface for toggling pixels and pattern management.
class CustomPatternEditor extends StatefulWidget {
  /// Creates a custom pattern editor.
  const CustomPatternEditor({
    super.key,
    this.initialPattern,
    required this.onSave,
    required this.onCancel,
  });

  /// Initial pattern to edit (null for new pattern).
  final CustomPattern? initialPattern;

  /// Callback when pattern is saved.
  final void Function(CustomPattern pattern) onSave;

  /// Callback when editing is cancelled.
  final VoidCallback onCancel;

  @override
  State<CustomPatternEditor> createState() => _CustomPatternEditorState();
}

class _CustomPatternEditorState extends State<CustomPatternEditor> {
  late CustomPattern _pattern;
  late TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.initialPattern != null) {
      _pattern = widget.initialPattern!;
    } else {
      _pattern = CustomPattern.create(name: 'New Pattern');
    }

    _nameController = TextEditingController(text: _pattern.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _togglePixel(int row, int col) {
    setState(() {
      final newGrid = List.generate(
        _pattern.gridSize,
        (i) => List.generate(_pattern.gridSize, (j) => _pattern.grid[i][j]),
      );
      newGrid[row][col] = !newGrid[row][col];

      _pattern = _pattern.copyWith(grid: newGrid);
    });
  }

  void _clearPattern() {
    setState(() {
      final emptyGrid = List.generate(
        _pattern.gridSize,
        (i) => List.generate(_pattern.gridSize, (j) => false),
      );
      _pattern = _pattern.copyWith(grid: emptyGrid);
    });
  }

  void _fillPattern() {
    setState(() {
      final filledGrid = List.generate(
        _pattern.gridSize,
        (i) => List.generate(_pattern.gridSize, (j) => true),
      );
      _pattern = _pattern.copyWith(grid: filledGrid);
    });
  }

  void _savePattern() {
    if (_formKey.currentState!.validate()) {
      final updatedPattern = _pattern.copyWith(name: _nameController.text);
      widget.onSave(updatedPattern);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(DesignSystem.spaceLg),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.pattern, color: theme.colorScheme.primary),
                  const SizedBox(width: DesignSystem.spaceSm),
                  Text(
                    'Custom Pattern Editor',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignSystem.spaceLg),

              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Pattern Name',
                  hintText: 'Enter pattern name',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a pattern name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: DesignSystem.spaceLg),

              // Pattern grid
              Center(
                child: Column(
                  children: [
                    Text(
                      'Pattern Grid (${_pattern.gridSize}x${_pattern.gridSize})',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: DesignSystem.spaceSm),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.colorScheme.outline),
                        borderRadius: BorderRadius.circular(
                          DesignSystem.radiusSm,
                        ),
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _pattern.gridSize,
                        ),
                        itemCount: _pattern.gridSize * _pattern.gridSize,
                        itemBuilder: (context, index) {
                          final row = index ~/ _pattern.gridSize;
                          final col = index % _pattern.gridSize;
                          final isFilled = _pattern.grid[row][col];

                          return GestureDetector(
                            onTap: () {
                              // Add haptic feedback
                              HapticFeedback.lightImpact();
                              _togglePixel(row, col);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: isFilled
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.surface,
                                border: Border.all(
                                  color: theme.colorScheme.outline,
                                ),
                                borderRadius: BorderRadius.circular(
                                  DesignSystem.radiusSm,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLg),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _clearPattern,
                      child: const Text('Clear'),
                    ),
                  ),
                  const SizedBox(width: DesignSystem.spaceSm),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _fillPattern,
                      child: const Text('Fill'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignSystem.spaceMd),

              // Save/Cancel buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: widget.onCancel,
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: DesignSystem.spaceSm),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _savePattern,
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
