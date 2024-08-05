import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';
import 'drop_area_placeholder.dart';

class FormBuilderGrid extends StatefulWidget {
  final Function(VariableDto addedVariable, int row) onVariableAdded;
  final Function(DragTargetDetails<VariableDto> details) onAcceptWithDetails;
  final List<TableRow> Function(BuildContext context) rowBuilder;

  const FormBuilderGrid({
    required this.onVariableAdded,
    required this.onAcceptWithDetails,
    required this.rowBuilder,
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
      builder: (context, candidateData, rejectedData) => Table(
        children: widget.rowBuilder.call(context),
      ),
    );
  }
}
