import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../form_builder_screen.dart';
import '../utils/form_builder_utils.dart';

class FormBuilderGrid extends StatefulWidget {
  final Map<int, List<FormItem>> variablen;
  final Function(DragTargetDetails<VariableDto> details) onAcceptWithDetails;
  final int hoveringOverRow;

  const FormBuilderGrid({
    required this.variablen,
    required this.onAcceptWithDetails,
    required this.hoveringOverRow,
    super.key,
  });

  @override
  State<FormBuilderGrid> createState() => _FormBuilderGridState();
}

class _FormBuilderGridState extends State<FormBuilderGrid> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<VariableDto>(
      onAcceptWithDetails: widget.onAcceptWithDetails,
      builder: (context, candidateData, rejectedData) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _createRows(candidateData),
        ),
      ),
    );
  }

  List<Widget> _createRows(List<VariableDto?> candidateData) {
    List<Widget> rows = [];

    for (int i = 1; widget.variablen[i] != null; i++) {
      var varsInRow = widget.variablen[i]!;
      varsInRow.sort((e1, e2) => e1.variable.col.compareTo(e2.variable.col));
      rows.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ...varsInRow.map(
              (e) => Flexible(
                child: FormBuilderUtils.getBuilderInputElement(
                  e.key,
                  e.variable,
                ),
              ),
            ),
            Visibility(
              visible: candidateData.isNotEmpty && widget.hoveringOverRow == i,
              child: Flexible(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return rows;
  }
}
