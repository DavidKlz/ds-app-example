import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';
import 'fields/fields.dart';

class InputFieldGenerator {
  InputFieldGenerator._();

  static Widget generateFieldFor(VariableDto variable) {
    switch (variable.controltyp) {
      case Controltyp.textField:
        return DmTextField(variable: variable);
      case Controltyp.textArea:
        return DmTextField(variable: variable);
      case Controltyp.checkBox:
        return _generateCheckbox(variable);
      case Controltyp.calendar:
        return variable.datentyp == Datentyp.date
            ? DmDateField(variable: variable)
            : DmDateTimeField(variable: variable);
      case Controltyp.dropdown:
        return _generateSingleDropdown(variable);
    }
  }

  static Widget _generateCheckbox(VariableDto variable) {
    return Row(
      children: [
        Text("${variable.name}:"),
        Checkbox(value: false, onChanged: (val) {}),
      ],
    );
  }

  static DropdownMenu _generateSingleDropdown(VariableDto variable) {
    return DropdownMenu(
      label: Text(variable.name),
      dropdownMenuEntries: const [],
    );
  }
}
