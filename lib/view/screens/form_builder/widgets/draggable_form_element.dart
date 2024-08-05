import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';

class DraggableFormElement extends StatelessWidget {
  final VariableDto data;
  final Size size;
  final Function(VariableDto draggedItem) onDragStarted;
  final Function(DragUpdateDetails details) onDragUpdate;
  final VoidCallback onDragFinished;

  const DraggableFormElement({
    required this.data,
    required this.size,
    required this.onDragStarted,
    required this.onDragFinished,
    required this.onDragUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<VariableDto>(
      feedback: Opacity(opacity: 0.5, child: FormBuilderUtils.getInputCard(data, size)),
      data: data,
      onDragStarted: () => onDragStarted.call(data),
      onDragUpdate: onDragUpdate,
      onDragCompleted: onDragFinished,
      onDragEnd: (details) => onDragFinished.call(),
      onDraggableCanceled: (velocity, offset) => onDragFinished.call(),
      child: FormBuilderUtils.getInputCard(data, size),
    );
  }
}
