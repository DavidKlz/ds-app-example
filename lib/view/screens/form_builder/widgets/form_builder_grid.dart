import 'package:ds_next/view/screens/form_builder/widgets/variable_input_element.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/variable_dto.dart';

class FormBuilderGrid extends StatefulWidget {
  final Map<int, List<VariableDto>> variablen;
  final Function(
          DragTargetDetails<VariableDto> details, int targetRow, int targetCol)
      onAcceptWithDetails;
  final Function(VariableDto variable) onTapped;

  const FormBuilderGrid({
    required this.variablen,
    required this.onAcceptWithDetails,
    required this.onTapped,
    super.key,
  });

  @override
  State<FormBuilderGrid> createState() => _FormBuilderGridState();
}

class _FormBuilderGridState extends State<FormBuilderGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ..._createRows(),
              SizedBox(
                height:
                    (constraints.maxHeight - 50 * widget.variablen.length < 50)
                        ? 50
                        : constraints.maxHeight - 50 * widget.variablen.length,
                width: constraints.maxWidth,
                child: DragTarget<VariableDto>(
                  onAcceptWithDetails: (details) => widget.onAcceptWithDetails
                      .call(details, widget.variablen.length + 1, 1),
                  builder: (context, candidateData, rejectedData) => Visibility(
                    visible: candidateData.isNotEmpty,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  List<Widget> _createRows() {
    List<Widget> rows = [];
    for (var varsInRow in widget.variablen.values) {
      varsInRow.sort((e1, e2) => e1.col.compareTo(e2.col));
      rows.add(
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ...varsInRow.map(
              (e) => Flexible(
                child: VariableInputElement(
                  variable: e,
                  onAcceptWithDetails: widget.onAcceptWithDetails,
                  onTapped: widget.onTapped,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
