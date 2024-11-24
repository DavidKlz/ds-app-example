import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../logic/data/variable_dto.dart';

class DmTimeField extends StatefulWidget {
  final VariableDto variable;
  final bool isEnabled;

  const DmTimeField({required this.variable, this.isEnabled = true, super.key});

  @override
  State<DmTimeField> createState() => _DmTimeFieldState();
}

class _DmTimeFieldState extends State<DmTimeField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        FilteringTextInputFormatter(RegExp("[0-9:]"), allow: true),
        LengthLimitingTextInputFormatter(5),
        _TimeTextFormatter(),
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "HH:mm",
        suffixIcon: IconButton(
          onPressed: () {
            if (widget.isEnabled) {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then(
                (value) => controller.text =
                    value != null ? "${value.hour}:${value.minute}" : "",
              );
            }
          },
          icon: const Icon(Icons.access_time),
        ),
      ),
    );
  }
}

class _TimeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeparators(newValue.text, ':');
    return newValue.copyWith(
        text: dateText, selection: _updateCursorPosition(dateText));
  }

  String _addSeparators(String value, String separator) {
    value = value.replaceAll(separator, '');
    var newValue = '';
    for (int i = 0; i < value.length; i++) {
      newValue += value[i];
      if (i == 1) {
        newValue += separator;
      }
    }
    return newValue;
  }

  TextSelection _updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
