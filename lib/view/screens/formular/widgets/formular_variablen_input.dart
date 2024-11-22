import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/ds_next_theme_utils.dart';
import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';

class FormularVariablenInput extends StatefulWidget {
  final VariableDto variable;
  final Function(VariableDto variable) onRemove;

  FormularVariablenInput({required this.onRemove, VariableDto? variable, super.key})
      : variable = variable ??
            VariableDto(
              name: "",
              controltyp: Controltyp.textField,
              datentyp: Datentyp.text,
              row: -1,
              col: -1,
              colSpan: -1,
            );

  @override
  State<FormularVariablenInput> createState() => _FormularVariablenInputState();
}

class _FormularVariablenInputState extends State<FormularVariablenInput> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.variable.name;
  }

  @override
  Widget build(BuildContext context) {
    var datentypMenu = DropdownMenu(
      width: 250,
      dropdownMenuEntries: widget.variable.controltyp
          .getDatentypen()
          .map(
            (e) => DropdownMenuEntry(value: e, label: e.displayName),
          )
          .toList(),
      onSelected: (value) =>
          setState(() => widget.variable.datentyp = value ?? Datentyp.text),
      initialSelection: widget.variable.datentyp,
      label: const Text("Datentyp"),
    );
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
          onSelected: (value) => setState(() {
            widget.variable.controltyp = value ?? Controltyp.textField;
            widget.variable.datentyp =
                widget.variable.controltyp.getDatentypen().first;
          }),
          initialSelection: widget.variable.controltyp,
          label: const Text("Controltyp"),
        ),
        datentypMenu,
        IconButton(onPressed: () => widget.onRemove.call(widget.variable), icon: const Icon(Icons.close)),
        _layoutInputs(),
      ],
    );
  }

  Widget _layoutInputs() {
    return Row(
      children: [
        _layoutInput(
          "Row",
          widget.variable.row,
          (value) => widget.variable.row = value,
        ),
        const SizedBox(width: 8),
        _layoutInput(
          "Col",
          widget.variable.col,
          (value) => widget.variable.col = value,
        ),
        const SizedBox(width: 8),
        _layoutInput(
          "Col Span",
          widget.variable.colSpan,
          (value) => widget.variable.colSpan = value,
        ),
      ],
    );
  }

  Widget _layoutInput(String label, int initialVal, Function(int value) onChanged) {
    TextEditingController controller = TextEditingController();
    controller.text = "$initialVal";

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$label:"),
        const SizedBox(width: 4),
        SizedBox(
          width: 40,
          height: 25,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "0",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) =>
                onChanged.call(value.isNotEmpty ? int.parse(value) : -1),
          ),
        ),
      ],
    );
  }
}
