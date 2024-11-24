import 'package:ds_next/logic/data/variable_dto.dart';
import 'package:flutter/material.dart';

class DmTextField extends StatefulWidget {
  final VariableDto variable;

  const DmTextField({required this.variable, super.key});

  @override
  State<DmTextField> createState() => _DmTextFieldState();
}

class _DmTextFieldState extends State<DmTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.variable.name,
      ),
    );
  }
}
