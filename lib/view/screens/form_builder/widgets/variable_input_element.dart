import 'package:ds_next/logic/data/variable_dto.dart';
import 'package:flutter/material.dart';

import '../utils/form_builder_utils.dart';

class VariableInputElement extends StatefulWidget {
  final VariableDto variable;
  final Function(
      DragTargetDetails<VariableDto> details, int targetRow, int targetCol)
  onAcceptWithDetails;
  final Function(VariableDto variable) onTapped;

  const VariableInputElement({required this.variable, required this.onAcceptWithDetails, required this.onTapped, super.key});

  @override
  State<VariableInputElement> createState() => _VariableInputElementState();
}

class _VariableInputElementState extends State<VariableInputElement> {
  bool insertLeft = false;
  bool insertRight = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Visibility(
              visible: insertLeft,
              child: Flexible(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(child: Icon(Icons.add)),
                ),
              ),
            ),
            Flexible(
              child: FormBuilderUtils.getBuilderInputElement(widget.variable, widget.onTapped),
            ),
            Visibility(
              visible: insertRight,
              child: Flexible(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(child: Icon(Icons.add)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Flexible(
                child: DragTarget<VariableDto>(
                    onMove: (details) => setState(() => insertLeft = true),
                    onLeave: (data) => setState(() => insertLeft = false),
                    onAcceptWithDetails: (details) {
                      setState(() => insertLeft = false);
                      widget.onAcceptWithDetails.call(details, widget.variable.row, widget.variable.col);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container();
                    }),
              ),
              Flexible(
                child: DragTarget<VariableDto>(
                    onMove: (details) => setState(() => insertRight = true),
                    onLeave: (data) => setState(() => insertRight = false),
                    onAcceptWithDetails: (details) {
                      setState(() => insertRight = false);
                      widget.onAcceptWithDetails.call(details, widget.variable.row, widget.variable.col + 1);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container();
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
