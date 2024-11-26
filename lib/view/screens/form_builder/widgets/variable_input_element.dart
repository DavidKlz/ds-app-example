import 'package:auto_size_text/auto_size_text.dart';
import 'package:ds_next/logic/data/variable_dto.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../utils/form_builder_utils.dart';

class VariableInputElement extends StatefulWidget {
  final VariableDto variable;
  final Function(
          DragTargetDetails<VariableDto> details, int targetRow, int targetCol)
      onAcceptWithDetails;
  final Function(VariableDto variable) onTapped;

  const VariableInputElement({
    required this.variable,
    required this.onAcceptWithDetails,
    required this.onTapped,
    super.key,
  });

  @override
  State<VariableInputElement> createState() => _VariableInputElementState();
}

class _VariableInputElementState extends State<VariableInputElement> {
  bool insertLeft = false;
  bool insertRight = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
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
              child: Draggable<VariableDto>(
                data: widget.variable,
                feedback: FeedbackInputElement(
                    variable: widget.variable, parentKey: key),
                childWhenDragging: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(child: Icon(Icons.remove)),
                ),
                child: FormBuilderUtils.getBuilderInputElement(
                    widget.variable, widget.onTapped, key),
              ),
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
                    onMove: (details) => setState(
                        () => insertLeft = (details.data != widget.variable)),
                    onLeave: (data) => setState(() => insertLeft = false),
                    onAcceptWithDetails: (details) {
                      setState(() => insertLeft = false);
                      if (widget.variable != details.data) {
                        widget.onAcceptWithDetails.call(
                            details, widget.variable.row, widget.variable.col);
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container();
                    }),
              ),
              Flexible(
                child: DragTarget<VariableDto>(
                    onMove: (details) => setState(
                        () => insertRight = (details.data != widget.variable)),
                    onLeave: (data) => setState(() => insertRight = false),
                    onAcceptWithDetails: (details) {
                      setState(() => insertRight = false);
                      if (widget.variable != details.data) {
                        widget.onAcceptWithDetails.call(details,
                            widget.variable.row, widget.variable.col + 1);
                      }
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

class FeedbackInputElement extends StatelessWidget {
  final GlobalKey parentKey;
  final VariableDto variable;

  const FeedbackInputElement(
      {required this.variable, required this.parentKey, super.key});

  @override
  Widget build(BuildContext context) {
    var size = (parentKey.currentContext?.findRenderObject() as RenderBox).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    switch (variable.controltyp) {
      case Controltyp.textField:
      case Controltyp.textArea:
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: AutoSizeText(
            variable.name,
            maxLines: 1,
            wrapWords: false,
          ),
        );
      case Controltyp.checkBox:
        return Checkbox(value: true, onChanged: (val) {});
      case Controltyp.calendar:
        return (variable.datentyp == Datentyp.date)
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      variable.name,
                      maxLines: 1,
                      wrapWords: false,
                    ),
                    const Icon(Icons.calendar_month)
                  ],
                ),
              )
            : Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          variable.name,
                          maxLines: 1,
                          wrapWords: false,
                        ),
                        const Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "HH:mm",
                          maxLines: 1,
                          wrapWords: false,
                        ),
                        Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ],
              );
      case Controltyp.dropdown:
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                variable.name,
                maxLines: 1,
                wrapWords: false,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        );
    }
  }
}
