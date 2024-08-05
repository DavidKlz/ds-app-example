import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';
import '../../dyn_mask/generator/fields/fields.dart';

class FormBuilderUtils {
  FormBuilderUtils._();

  static Widget getInputCard(VariableDto data, Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(data.controltyp.displayName),
            subtitle: Text(data.datentyp.displayName),
            leading: Icon(FormBuilderUtils.getIcon(data)),
          ),
        ),
      ),
    );
  }

  static Widget getBuilderInputElement(VariableDto data) {
    switch (data.controltyp) {
      case Controltyp.textField:
        return const TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
        );
      case Controltyp.textArea:
        return const TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          maxLines: 10,
        );
      case Controltyp.checkBox:
        return Checkbox(value: true, onChanged: (val) {});
      case Controltyp.calendar:
        return (data.datentyp == Datentyp.date)
            ? DmDateField(variable: data)
            : DmDateTimeField(variable: data);
      case Controltyp.dropdown:
        return const DropdownMenu(dropdownMenuEntries: []);
    }
  }

  static IconData getIcon(VariableDto data) {
    switch (data.controltyp) {
      case Controltyp.textField:
        return (data.datentyp == Datentyp.text) ? Icons.text_fields : Icons.pin;
      case Controltyp.textArea:
        return Icons.text_fields;
      case Controltyp.checkBox:
        return Icons.check_box;
      case Controltyp.calendar:
        return (data.datentyp == Datentyp.date)
            ? Icons.calendar_month
            : Icons.access_time;
      case Controltyp.dropdown:
        return (data.datentyp == Datentyp.singleSelection)
            ? Icons.done
            : Icons.done_all;
    }
  }
}
