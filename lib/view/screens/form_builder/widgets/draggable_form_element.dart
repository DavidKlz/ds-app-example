import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';

class DraggableFormElement extends StatelessWidget {
  final VariableDto data;
  final Function(DragUpdateDetails details) onDragUpdate;

  const DraggableFormElement(
      {required this.data, required this.onDragUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Draggable<VariableDto>(
      feedback: Opacity(
        opacity: 0.5,
        child: FeedbackCard(
          data: data,
          parentKey: key,
        ),
      ),
      data: data,
      onDragUpdate: onDragUpdate,
      child: FormBuilderUtils.getInputCard(data, key),
    );
  }
}

class FeedbackCard extends StatelessWidget {
  final GlobalKey parentKey;
  final VariableDto data;

  const FeedbackCard({required this.data, required this.parentKey, super.key});

  @override
  Widget build(BuildContext context) {
    var size = (parentKey.currentContext?.findRenderObject() as RenderBox).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: AutoSizeText(
              data.controltyp.displayName,
              maxLines: 1,
              wrapWords: false,
            ),
            subtitle: AutoSizeText(
              data.datentyp.displayName,
              maxLines: 1,
              wrapWords: false,
            ),
            leading: Icon(FormBuilderUtils.getIcon(data)),
          ),
        ),
      ),
    );
  }
}
