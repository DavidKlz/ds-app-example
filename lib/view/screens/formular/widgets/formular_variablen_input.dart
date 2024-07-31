import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/ds_next_theme_utils.dart';
import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variablen_dto.dart';

class FormularVariablenInput extends StatefulWidget {
  final VariablenDto variable;

  FormularVariablenInput({VariablenDto? variable, super.key})
      : variable = variable ??
            VariablenDto(
                name: "",
                controltyp: Controltyp.textField,
                datentyp: Datentyp.text);

  @override
  State<FormularVariablenInput> createState() => _FormularVariablenInputState();
}

class _FormularVariablenInputState extends State<FormularVariablenInput> {
  TextEditingController nameController = TextEditingController();
  TextEditingController datentypController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.variable.name;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: DsNextThemeUtils.getDefaultSpacing(context),
      runSpacing: DsNextThemeUtils.getDefaultSpacing(context),
      children: [
        const Divider(),
        Container(
          constraints: const BoxConstraints(
            minWidth: 250,
            maxWidth: 500,
          ),
          child: TextField(
            controller: nameController,
            onChanged: (value) => setState(() => widget.variable.name = value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
        ),
        DropdownMenu(
          dropdownMenuEntries: Controltyp.values
              .map(
                (e) => DropdownMenuEntry(value: e, label: e.displayName),
              )
              .toList(),
          onSelected: (value) => setState(
              () => widget.variable.controltyp = value ?? Controltyp.textField),
          initialSelection: widget.variable.controltyp,
          label: const Text("Controltyp"),
        ),
        DropdownMenu(
          width: 250,
          dropdownMenuEntries: widget.variable.controltyp
              .getDatentypen()
              .map(
                (e) => DropdownMenuEntry(value: e, label: e.displayName),
              )
              .toList(),
          onSelected: (value) =>
              setState(() => widget.variable.datentyp = value ?? Datentyp.text),
          initialSelection: widget.variable.controltyp.getDatentypen().first,
          label: const Text("Datentyp"),
        ),
      ],
    );
  }
}
