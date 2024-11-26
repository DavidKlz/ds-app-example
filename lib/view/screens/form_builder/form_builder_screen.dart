import 'dart:developer';

import 'package:ds_next/view/screens/form_builder/widgets/edit_variable_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/router/ds_next_routes.dart';
import '../../../logic/data/enum/controltyp.dart';
import '../../../logic/data/enum/datentyp.dart';
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
  Map<int, List<VariableDto>> varsKV = {};
  Offset dragPosition = Offset.zero;

  @override
  void initState() {
    updateVars();
    super.initState();
  }

  void updateVars() {
    varsKV.clear();
    for (var variable in widget.form.variablen) {
      if (varsKV.containsKey(variable.row)) {
        varsKV.update(variable.row, (value) => value..add(variable));
      } else {
        varsKV.putIfAbsent(variable.row, () => [variable]);
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
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                DsNextRoutes.form,
                arguments: widget.form),
            icon: const Icon(Icons.arrow_back)),
        actions: [
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
          onTapped: _editVariable,
        ),
      ),
    );
  }

  _onDragUpdate(DragUpdateDetails details) {
    _key.currentState?.closeEndDrawer();
  }

  _onAcceptWithDetails(
      DragTargetDetails<VariableDto> details, int targetRow, targetCol) async {
    if (details.data.name.isEmpty) {
      var editedVar = await _showBottomSheet(details.data);
      widget.form.variablen = widget.form.variablen
          .map(
            (e) => (e.row == targetRow && e.col >= targetCol)
            ? (e..col = e.col + 1)
            : e,
      ).toList();
      _sortAndNormalize();
      setState(() {
        widget.form.variablen.add(VariableDto(
          name: editedVar.name,
          controltyp: details.data.controltyp,
          datentyp: details.data.datentyp,
          row: targetRow,
          col: targetCol,
          colSpan: -1,
        ));
        updateVars();
      });
    } else {
      widget.form.variablen.remove(details.data);
      widget.form.variablen = widget.form.variablen
          .map(
            (e) => (e.row == targetRow && e.col >= targetCol)
            ? (e..col = e.col + 1)
            : e,
      ).toList();
      _sortAndNormalize();
      setState(() {
        widget.form.variablen.add(VariableDto(
          name: details.data.name,
          controltyp: details.data.controltyp,
          datentyp: details.data.datentyp,
          row: targetRow,
          col: targetCol,
          colSpan: -1,
        ));
        updateVars();
      });
    }
  }

  _sortAndNormalize() {
    widget.form.variablen.sort((a, b) => a.row.compareTo(b.row),);
    int row = 1;
    int currentRow = 0;
    do {
      currentRow = widget.form.variablen.firstWhere((element) => element.row > currentRow).row;
      widget.form.variablen = widget.form.variablen.map((e) => e.row == currentRow ? (e..row = row) : e).toList();
      row++;
    } while(widget.form.variablen.where((element) => element.row > row).isNotEmpty);
  }

  _editVariable(VariableDto variable) async {
    await _showBottomSheet(variable);
    setState(() {});
  }

  _showBottomSheet(VariableDto variable) {
    return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => EditVariableModalBottomSheet(variable: variable),
    );
  }
}
