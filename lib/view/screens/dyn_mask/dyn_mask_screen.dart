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
          child: Column(
            children: _creatRows(form.variablen),
          ),
        ),
      ),
    );
  }

  List<Widget> _creatRows(List<VariableDto> variablen) {
    var rows = List<Widget>.empty(growable: true);
    var rowMap = <int, List<VariableDto>>{};

    for (var e in variablen) {
      if (rowMap.containsKey(e.row)) {
        rowMap.update(e.row, (value) => value..add(e));
      } else {
        rowMap.putIfAbsent(
          e.row,
          () => [e],
        );
      }
    }

    for (var e in rowMap.values) {
      rows.add(Row(
        children: e
            .map(
              (e) => Flexible(child: InputFieldGenerator.generateFieldFor(e)),
            )
            .toList(),
      ));
      rows.add(_rowSpacer);
    }
    return rows;
  }

  SizedBox get _rowSpacer => const SizedBox(height: 8);
}
