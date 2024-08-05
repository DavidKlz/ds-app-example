import 'package:flutter/material.dart';

import '../../../config/router/ds_next_routes.dart';
import '../../../logic/data/formular_dto.dart';
import '../../../logic/data/variable_dto.dart';
import 'utils/form_builder_utils.dart';
import 'widgets/form_builder_grid.dart';
import 'widgets/input_elements_menu.dart';

class FormBuilderScreen extends StatefulWidget {
  final FormularDto form;

  const FormBuilderScreen({required this.form, super.key});

  @override
  State<FormBuilderScreen> createState() => _FormBuilderScreenState();
}

class _FormBuilderScreenState extends State<FormBuilderScreen> {
  bool isDragging = false;
  Offset dragPosition = const Offset(0, 0);
  Offset dropPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formular Builder"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                DsNextRoutes.form,
                arguments: widget.form),
            icon: const Icon(Icons.edit_note),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              children: [
                Text("Drag: ${dragPosition.dx} / ${dragPosition.dy}"),
                Text("Drop: ${dropPosition.dx} / ${dropPosition.dy}"),
                FormBuilderGrid(
                  onVariableAdded: _onVariableAdded,
                  onAcceptWithDetails: _onAcceptWithDetails,
                  rowBuilder: _rowBuilder,
                ),
              ],
            ),
          ),
          InputElementsMenu(
            widthPercent: 0.15,
            onDragFinished: _onDragFinished,
            onDragStarted: _onDragStarted,
            onDragUpdate: _onDragUpdate,
          ),
        ],
      ),
    );
  }

  void _onVariableAdded(VariableDto addedVariable, int row) {
    addedVariable.row = row;
    setState(() => widget.form.variablen.add(addedVariable));
  }

  void _onDragFinished() {
    setState(() => isDragging = false);
  }

  _onDragStarted(VariableDto draggedItem) {
    setState(() => isDragging = true);
  }

  _onDragUpdate(DragUpdateDetails details) {
    setState(() => dragPosition = details.globalPosition);
  }

  List<TableRow> _rowBuilder(BuildContext context) {
    List<TableRow> rows = [];
    widget.form.variablen.sort((a, b) => a.row.compareTo(b.row));

    for (int i = 1;
        widget.form.variablen.where((element) => element.row == i).isNotEmpty;
        i++) {
      List<VariableDto> varsInRow =
          widget.form.variablen.where((element) => element.row == i).toList();
      varsInRow.sort((a, b) => a.col.compareTo(b.col));
      rows.add(
        TableRow(
          children: varsInRow
              .map((e) => FormBuilderUtils.getBuilderInputElement(e))
              .toList(),
        ),
      );
    }

    if(isDragging) {
      rows.add(TableRow(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.add),
          ),
        ]
      ));
    }

    return rows;
  }

  _onAcceptWithDetails(DragTargetDetails<VariableDto> details) {
    setState(() => dropPosition = details.offset);
  }
}
