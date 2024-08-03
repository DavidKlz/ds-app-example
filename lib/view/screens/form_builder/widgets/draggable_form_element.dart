import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';

class DraggableFormElement extends StatelessWidget {
  final VariableDto data;

  const DraggableFormElement({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<VariableDto>(
      feedback: FormBuilderUtils.getFeedback(data),
      data: data,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(data.controltyp.displayName),
            subtitle: Text(data.datentyp.displayName),
            leading: Icon(FormBuilderUtils.getIcon(data)),
          ),
        ),
      ),
    );
  }
}
