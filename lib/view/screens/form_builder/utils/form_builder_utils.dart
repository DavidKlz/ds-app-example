import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';
import '../../dyn_mask/generator/fields/fields.dart';

class FormBuilderUtils {
  FormBuilderUtils._();

  static Widget getInputCard(VariableDto data, Key key) {
    return Card(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: AutoSizeText(
            data.controltyp.displayName,
            maxLines: 1,
            wrapWords: false,
          ),
          subtitle: AutoSizeText(
            data.datentyp.displayName,
            maxLines: 1,
            wrapWords: false,
          ),
          leading: Icon(FormBuilderUtils.getIcon(data)),
        ),
      ),
    );
  }

  static Widget getBuilderInputElement(VariableDto data, Function(VariableDto variable) onTapped) {
    return GestureDetector(
      onTap: () => onTapped.call(data),
      child: _getBuilderInputElementChild(data),
    );
  }

  static Widget _getBuilderInputElementChild(VariableDto data) {
    switch (data.controltyp) {
      case Controltyp.textField:
        return TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: data.name,
            border: const OutlineInputBorder(),
          ),
        );
      case Controltyp.textArea:
        return TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: data.name,
            border: const OutlineInputBorder(),
          ),
          maxLines: 10,
        );
      case Controltyp.checkBox:
        return Checkbox(value: true, onChanged: (val) {});
      case Controltyp.calendar:
        return (data.datentyp == Datentyp.date)
            ? DmDateField(variable: data, isEnabled: false)
            : DmDateTimeField(variable: data, isEnabled: false);
      case Controltyp.dropdown:
        return const DropdownMenu(
          enabled: false,
          width: double.infinity,
          dropdownMenuEntries: [],
        );
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
