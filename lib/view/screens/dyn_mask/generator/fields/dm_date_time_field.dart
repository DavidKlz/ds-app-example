import 'package:flutter/material.dart';

import '../../../../../logic/data/variable_dto.dart';
import 'dm_date_field.dart';
import 'dm_time_field.dart';

class DmDateTimeField extends StatelessWidget {
  final VariableDto variable;
  final bool isEnabled;

  const DmDateTimeField(
      {required this.variable, this.isEnabled = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: DmDateField(
            variable: variable,
            isEnabled: isEnabled,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: DmTimeField(
            variable: variable,
            isEnabled: isEnabled,
          ),
        ),
      ],
    );
  }
}
