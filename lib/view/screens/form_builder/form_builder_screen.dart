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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Map<int, List<FormItem>> varsKV = {};
  Offset dragPosition = Offset.zero;
  int hoveringOverRow = -1;

  @override
  void initState() {
    updateVars();
    super.initState();
  }

  void updateVars() {
    varsKV.clear();
    for (var variable in widget.form.variablen) {
      if (varsKV.containsKey(variable.row)) {
        varsKV.update(
            variable.row,
            (value) =>
                value..add(FormItem(key: GlobalKey(), variable: variable)));
      } else {
        varsKV.putIfAbsent(variable.row,
            () => [FormItem(key: GlobalKey(), variable: variable)]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text("Formular Builder"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                DsNextRoutes.form,
                arguments: widget.form),
            icon: const Icon(Icons.edit_note),
          ),
          IconButton(
            onPressed: () => _key.currentState?.openEndDrawer(),
            icon: const Icon(Icons.build_circle_outlined),
          )
        ],
      ),
      endDrawer: Drawer(
        child: InputElementsMenu(
          width: MediaQuery.of(context).size.width * 0.1,
          onDragUpdate: _onDragUpdate,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: FormBuilderGrid(
          variablen: varsKV,
          onAcceptWithDetails: _onAcceptWithDetails,
          hoveringOverRow: hoveringOverRow,
        ),
      ),
    );
  }

  _onDragUpdate(DragUpdateDetails details) {
    _key.currentState?.closeEndDrawer();
    dragPosition = details.globalPosition;

    var allValues = List<FormItem>.empty(growable: true);
    varsKV.values.forEach((element) => allValues.addAll(element));
    var elementAtPosition = allValues.where((element) {
      var renderObject = element.key.currentContext?.findRenderObject();
      if (renderObject != null) {
        renderObject = renderObject as RenderBox;
        Offset position = renderObject.localToGlobal(Offset.zero);
        return position.dx + renderObject.size.width > dragPosition.dx &&
            position.dx < dragPosition.dx &&
            position.dy > dragPosition.dy &&
            position.dy - renderObject.size.height < dragPosition.dy;
      }
      return false;
    });
    if(elementAtPosition.isNotEmpty) {
      setState(() => hoveringOverRow = elementAtPosition.first.variable.row);
    } else {
      setState(() => hoveringOverRow = -1);
    }
  }

  _onAcceptWithDetails(DragTargetDetails<VariableDto> details) {
    var allValues = List<FormItem>.empty(growable: true);
    varsKV.values.forEach((element) => allValues.addAll(element));
    var elementAtPosition = allValues.where((element) {
      var renderObject = element.key.currentContext?.findRenderObject();
      if (renderObject != null) {
        renderObject = renderObject as RenderBox;
        Offset position = renderObject.localToGlobal(Offset.zero);
        return position.dx + renderObject.size.width > dragPosition.dx &&
            position.dx < dragPosition.dx &&
            position.dy > dragPosition.dy &&
            position.dy - renderObject.size.height < dragPosition.dy;
      }
      return false;
    });

    if (elementAtPosition.isNotEmpty) {
      var elementOnPosition = elementAtPosition.first;
      var varsInRow = varsKV[elementOnPosition.variable.row]!
          .map((e) => e.variable)
          .toList();

      var sizeOfInputsInRow =
          MediaQuery.of(context).size.width / varsInRow.length;
      var indexOfDropTarget = varsInRow.indexOf(elementOnPosition.variable);
      var droppedBehindDropTarget =
          sizeOfInputsInRow * indexOfDropTarget + sizeOfInputsInRow / 2 <
              dragPosition.dx;
      widget.form.variablen = widget.form.variablen.map((e) {
        if (e.row == elementOnPosition.variable.row) {
          if ((e.col >= elementOnPosition.variable.col &&
                  !droppedBehindDropTarget) ||
              (e.col > elementOnPosition.variable.col &&
                  droppedBehindDropTarget)) {
            return e..col = e.col + 1;
          } else {
            return e;
          }
        } else {
          return e;
        }
      }).toList();

      log("Dropped on Row ${elementOnPosition.variable.row}");

      setState(() {
        widget.form.variablen.add(VariableDto(
          name: details.data.name,
          controltyp: details.data.controltyp,
          datentyp: details.data.datentyp,
          row: elementOnPosition.variable.row,
          col: droppedBehindDropTarget
              ? elementOnPosition.variable.col + 1
              : elementOnPosition.variable.col,
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
          row: varsKV.length + 1,
          col: 1,
          colSpan: -1,
        ));
        updateVars();
      });
    }
  }
}

class FormItem {
  GlobalKey key;
  VariableDto variable;

  FormItem({required this.key, required this.variable});
}
