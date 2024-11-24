import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../logic/data/variable_dto.dart';

class DmDateField extends StatefulWidget {
  final VariableDto variable;
  final bool isEnabled;

  const DmDateField({required this.variable, this.isEnabled = true, super.key});

  @override
  State<DmDateField> createState() => _DmDateFieldState();
}

class _DmDateFieldState extends State<DmDateField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        FilteringTextInputFormatter(RegExp("[0-9\\.]"), allow: true),
        LengthLimitingTextInputFormatter(10),
        _DateTextFormatter(),
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "dd.MM.yyyy",
        labelText: widget.variable.name,
        suffixIcon: IconButton(
          onPressed: () {
            if(widget.isEnabled) {
              showDatePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime(DateTime.now().year + 50))
                .then(
              (value) => controller.text =
                  value != null ? DateFormat("dd.MM.yyyy").format(value) : "",
            );
            }
          },
          icon: const Icon(Icons.calendar_month),
        ),
      ),
    );
  }
}

class _DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeparators(newValue.text, '.');
    return newValue.copyWith(
        text: dateText, selection: _updateCursorPosition(dateText));
  }

  String _addSeparators(String value, String separator) {
    value = value.replaceAll(separator, '');
    var newValue = '';
    for (int i = 0; i < value.length; i++) {
      newValue += value[i];
      if (i == 1 || i == 3) {
        newValue += separator;
      }
    }
    return newValue;
  }

  TextSelection _updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
