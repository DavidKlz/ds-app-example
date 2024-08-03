import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';
import '../../dyn_mask/generator/fields/fields.dart';

class FormBuilderUtils {
  FormBuilderUtils._();

  static Widget getFeedback(VariableDto data) {
    switch (data.controltyp) {
      case Controltyp.textField:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 250,
          height: 40,
        );
      case Controltyp.textArea:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 250,
          height: 80,
        );
      case Controltyp.checkBox:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 250,
          height: 40,
          child: const Icon(Icons.check_box),
        );
      case Controltyp.calendar:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 250,
          height: 40,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            (data.datentyp == Datentyp.date)
                ? Icons.calendar_month
                : Icons.access_time,
            color: Colors.grey,
          ),
        );
      case Controltyp.dropdown:
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 250,
          height: 40,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        );
    }
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
