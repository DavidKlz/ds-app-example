import 'dart:math';

import 'package:ds_next/logic/data/enum/datentyp.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/variable_dto.dart';
import 'draggable_form_element.dart';

class InputElementsMenu extends StatefulWidget {
  final double collapsedWidthPercent;
  final double expandedWidthPercent;

  const InputElementsMenu(
      {this.collapsedWidthPercent = 0.1,
      this.expandedWidthPercent = 0.25,
      super.key});

  @override
  State<InputElementsMenu> createState() => _InputElementsMenuState();
}

class _InputElementsMenuState extends State<InputElementsMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 0;
  double minWidth = 0;
  double currentWidth = 0;

  int duration = 250;

  bool isExpanded = false;
  late AnimationController animatedIconController;

  @override
  void initState() {
    super.initState();
    animatedIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    animatedIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width * widget.expandedWidthPercent;
    minWidth = MediaQuery.of(context).size.width * widget.collapsedWidthPercent;

    if (currentWidth == 0) {
      currentWidth = minWidth;
    }

    return Draggable(
      onDragStarted: () => setState(() => duration = 0),
      onDragUpdate: _onDragUpdate,
      onDragEnd: (_) => _onDragFinished,
      onDragCompleted: _onDragFinished,
      onDraggableCanceled: (velocity, offset) => _onDragFinished(),
      feedback: SizedBox(),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: duration),
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
        width: currentWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  /*IconButton(
                    onPressed: _onCollapseOrExpand,
                    icon: RotationTransition(
                      turns: Tween<double>(begin: 0, end: 1.0)
                          .animate(animatedIconController),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),*/
                  Expanded(
                      child: Center(
                          child: Text(
                    "Formular Elemente",
                    style: TextStyle(fontSize: 20),
                  ))),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.textField, Datentyp.text),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.textField, Datentyp.number),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltyp(Controltyp.textArea),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltyp(Controltyp.checkBox),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.calendar, Datentyp.date),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.calendar, Datentyp.dateTime),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.dropdown, Datentyp.singleSelection),
                      ),
                      DraggableFormElement(
                        data: VariableDto.ofControltypAndDatentyp(Controltyp.dropdown, Datentyp.multiSelection),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCollapseOrExpand() {
    /*if (isExpanded) {
      animatedIconController.reverse(from: 0.5);
      currentWidth = minWidth;
    } else {
      animatedIconController.forward(from: 0.0);
      currentWidth = maxWidth;
    }
    setState(() => isExpanded = !isExpanded);*/
  }

  void _onDragUpdate(DragUpdateDetails details) {
    /*setState(() => currentWidth =
        max(min(currentWidth - details.delta.dx, maxWidth), minWidth));*/
  }

  void _onDragFinished() {
    /*setState(() {
      duration = 250;
      if ((maxWidth - currentWidth).abs() < (minWidth - currentWidth).abs()) {
        if (isExpanded) {
          currentWidth = maxWidth;
        } else {
          _onCollapseOrExpand();
        }
      } else {
        if (isExpanded) {
          _onCollapseOrExpand();
        } else {
          currentWidth = minWidth;
        }
      }
    });*/
  }
}
