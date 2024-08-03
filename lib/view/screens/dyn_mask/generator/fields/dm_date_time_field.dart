import 'package:flutter/material.dart';

import '../../../../../logic/data/variable_dto.dart';
import 'dm_date_field.dart';
import 'dm_time_field.dart';

class DmDateTimeField extends StatelessWidget {
  final VariableDto variable;

  const DmDateTimeField({required this.variable, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: DmDateField(
            variable: variable,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: DmTimeField(
            variable: variable,
          ),
        ),
      ],
    );
  }
}
