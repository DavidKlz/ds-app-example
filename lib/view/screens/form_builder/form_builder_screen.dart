import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../config/router/ds_next_routes.dart';
import '../../../logic/data/formular_dto.dart';
import '../../../logic/data/variable_dto.dart';
import 'widgets/form_builder_grid.dart';
import 'widgets/input_elements_menu.dart';

class FormBuilderScreen extends StatefulWidget {
  final FormularDto form;

  const FormBuilderScreen({required this.form, super.key});

  @override
  State<FormBuilderScreen> createState() => _FormBuilderScreenState();
}

class _FormBuilderScreenState extends State<FormBuilderScreen> {
  Map<GlobalKey, VariableDto> varsKV = {};
  Offset dragPosition = Offset.zero;

  void updateVars() {
    varsKV.clear();
    widget.form.variablen.forEach(
      (element) => varsKV.putIfAbsent(
        GlobalKey(),
        () => element,
      ),
    );
  }

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
              width: MediaQuery.of(context).size.width * 0.9,
              height: double.infinity,
              child: FormBuilderGrid(
                variablen: varsKV,
                onAcceptWithDetails: _onAcceptWithDetails,
              )),
          InputElementsMenu(
            width: MediaQuery.of(context).size.width * 0.1,
            onDragUpdate: _onDragUpdate,
          ),
        ],
      ),
    );
  }

  _onDragUpdate(DragUpdateDetails details) {
    dragPosition = details.globalPosition;
  }

  _onAcceptWithDetails(DragTargetDetails<VariableDto> details) {
    var elementAtPosition = varsKV.keys.where((element) {
      var renderObject =
          element.currentContext?.findRenderObject();
      if(renderObject != null) {
        renderObject = renderObject as RenderBox;
        Offset position = renderObject.localToGlobal(Offset.zero);
        return position.dx + renderObject.size.width > dragPosition.dx &&
            position.dx < dragPosition.dx &&
            position.dy + renderObject.size.height > dragPosition.dy &&
            position.dy < dragPosition.dy;
      }
      return false;
    });

    if (elementAtPosition.isNotEmpty) {
      var elementOnPosition = varsKV[elementAtPosition.first] as VariableDto;
      var varsInRow =
          varsKV.values.where((element) => element.row == elementOnPosition.row).toList();

      log("Dropped on Row ${elementOnPosition.row}");

      setState(() {
        widget.form.variablen.add(VariableDto(
          name: details.data.name,
          controltyp: details.data.controltyp,
          datentyp: details.data.datentyp,
          row: elementOnPosition.row,
          col: 1,
          colSpan: -1,
        ));
        updateVars();
      });
    } else {
      setState(() {
        widget.form.variablen.add(VariableDto(
          name: details.data.name,
          controltyp: details.data.controltyp,
          datentyp: details.data.datentyp,
          row: widget.form.variablen.length + 1,
          col: 1,
          colSpan: -1,
        ));
        updateVars();
      });
    }
  }
}
