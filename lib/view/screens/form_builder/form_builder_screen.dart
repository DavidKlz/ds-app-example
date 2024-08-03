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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formular Builder"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(DsNextRoutes.form, arguments: widget.form),
            icon: const Icon(Icons.edit_note),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.9, child: FormBuilderGrid(variablen: widget.form.variablen, onVariableAdded: _onVariableAdded,)),
          InputElementsMenu(),
        ],
      ),
    );
  }

  void _onVariableAdded(VariableDto addedVariable, int row) {
    addedVariable.row = row;
    setState(() => widget.form.variablen.add(addedVariable));
  }
}
