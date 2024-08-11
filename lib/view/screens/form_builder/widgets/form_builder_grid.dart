import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';
import '../utils/form_builder_utils.dart';

class FormBuilderGrid extends StatefulWidget {
  final Map<GlobalKey, VariableDto> variablen;
  final Function(DragTargetDetails<VariableDto> details) onAcceptWithDetails;

  const FormBuilderGrid({
    required this.variablen,
    required this.onAcceptWithDetails,
    super.key,
  });

  @override
  State<FormBuilderGrid> createState() => _FormBuilderGridState();
}

class _FormBuilderGridState extends State<FormBuilderGrid> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<VariableDto>(
      onMove: (details) => setState(() => isHovered = true),
      onLeave: (data) => setState(() => isHovered = false),
      onAcceptWithDetails: _onAcceptWithDetails,
      builder: (context, candidateData, rejectedData) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _createRows(),
        ),
      ),
    );
  }

  List<Widget> _createRows() {
    List<Widget> rows = [];

    for (int i = 1;
        widget.variablen.values.where((element) => element.row == i).isNotEmpty;
        i++) {
      var varsInRow = widget.variablen.entries.where(
        (element) => element.value.row == i,
      );
      rows.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          children: varsInRow
              .map((e) => Flexible(
                  child:
                      FormBuilderUtils.getBuilderInputElement(e.key, e.value)))
              .toList(),
        ),
      );
    }

    rows.add(
      Visibility(
        visible: isHovered,
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
    );

    return rows;
  }

  void _onAcceptWithDetails(DragTargetDetails<VariableDto> details) {
    setState(() {
      isHovered = false;
    });
    widget.onAcceptWithDetails.call(details);
  }
}
