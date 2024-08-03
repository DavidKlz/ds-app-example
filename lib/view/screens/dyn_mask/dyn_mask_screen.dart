import 'package:flutter/material.dart';

import '../../../logic/data/formular_dto.dart';
import '../../../logic/data/variable_dto.dart';
import 'generator/input_field_generator.dart';

class DynMaskScreen extends StatelessWidget {
  final FormularDto form;

  const DynMaskScreen({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyn. Maske: ${form.name}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: _creatRows(form.variablen),
          ),
        ),
      ),
    );
  }

  List<TableRow> _creatRows(List<VariableDto> variablen) {
    var rows = List<TableRow>.empty(growable: true);
    for(var e in variablen) {
      rows.add(TableRow(
        children: [
          Text("${e.name}:"),
          InputFieldGenerator.generateFieldFor(e),
        ],
      ));
      rows.add(_rowSpacer);
    }
    return rows;
  }

  TableRow get _rowSpacer => const TableRow(children: [SizedBox(height: 8), SizedBox(height: 8)]);
}
