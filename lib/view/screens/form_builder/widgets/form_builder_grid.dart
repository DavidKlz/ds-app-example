import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';

class FormBuilderGrid extends StatelessWidget {
  final List<VariableDto> variablen;
  final Function(VariableDto addedVariable, int row) onVariableAdded;

  const FormBuilderGrid(
      {required this.variablen, required this.onVariableAdded, super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: _createRows(),
    );
  }

  List<TableRow> _createRows() {
    List<TableRow> rows = [];
    int currentRow = 0;
    variablen.sort(
      (a, b) => a.row.compareTo(b.row),
    );

    for (int i = 1;
        variablen.where((element) => element.row == i).isNotEmpty;
        i++) {
      currentRow = i;
      List<VariableDto> varsInRow =
          variablen.where((element) => element.row == i).toList();
      varsInRow.sort(
        (a, b) => a.col.compareTo(b.col),
      );
      rows.add(
        TableRow(
          children: varsInRow
              .map(
                (e) => DragTargetElement(
                  row: i,
                  data: e,
                  onVariableAdded: onVariableAdded,
                ),
              )
              .toList(),
        ),
      );
    }

    currentRow += 1;
    rows.add(
      TableRow(
        children: [
          TableCell(
            child: DragTargetElement(
              row: currentRow,
              onVariableAdded: onVariableAdded,
            ),
          ),
        ],
      ),
    );

    return rows;
  }
}

class DragTargetElement extends StatefulWidget {
  final VariableDto? data;
  final int row;
  final Function(VariableDto addedVar, int row) onVariableAdded;

  const DragTargetElement(
      {required this.row, required this.onVariableAdded, this.data, super.key});

  @override
  State<DragTargetElement> createState() => _DragTargetElementState();
}

class _DragTargetElementState extends State<DragTargetElement> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<VariableDto>(
      builder: (context, candidateData, rejectedData) {
        if (widget.data != null) {
          return FormBuilderUtils.getBuilderInputElement(widget.data!);
        } else {
          return Container(
            height: 40,
            decoration: BoxDecoration(
              border: isHovered
                  ? Border.all(
                      width: 1,
                      color: Colors.grey,
                    )
                  : null,
            ),
          );
        }
      },
      onAcceptWithDetails: (details) =>
          widget.onVariableAdded.call(details.data, widget.row),
      onMove: (details) => setState(() => isHovered = true),
      onLeave: (data) => setState(() => isHovered = false),
    );
  }
}
