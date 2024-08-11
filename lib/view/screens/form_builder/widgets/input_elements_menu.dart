import 'dart:math';

import 'package:ds_next/logic/data/enum/datentyp.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/variable_dto.dart';
import 'draggable_form_element.dart';

class InputElementsMenu extends StatelessWidget {
  final double width;
  final Function(DragUpdateDetails details) onDragUpdate;

  const InputElementsMenu({
    required this.width,
    required this.onDragUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final elementWidth = MediaQuery.of(context).size.width * 0.1 * 0.9;
    final elementHeight = MediaQuery.of(context).size.height / 10 - 16;

    final elementSize = Size(elementWidth, elementHeight);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(5, 0),
          )
        ],
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      width: width,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Formular Elemente",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.textField,
                        Datentyp.text,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.textField,
                        Datentyp.number,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltyp(Controltyp.textArea),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltyp(Controltyp.checkBox),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.calendar,
                        Datentyp.date,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.calendar,
                        Datentyp.dateTime,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.dropdown,
                        Datentyp.singleSelection,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                    DraggableFormElement(
                      data: VariableDto.ofControltypAndDatentyp(
                        Controltyp.dropdown,
                        Datentyp.multiSelection,
                      ),
                      onDragUpdate: onDragUpdate,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
