import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../logic/data/enum/controltyp.dart';
import '../../../../logic/data/enum/datentyp.dart';
import '../../../../logic/data/variable_dto.dart';

class EditVariableModalBottomSheet extends StatefulWidget {
  final VariableDto variable;

  const EditVariableModalBottomSheet({required this.variable, super.key});

  @override
  State<EditVariableModalBottomSheet> createState() =>
      _EditVariableModalBottomSheetState();
}

class _EditVariableModalBottomSheetState
    extends State<EditVariableModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Neue Variable",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () => (widget.variable.name.isNotEmpty)
                      ? Navigator.of(context).pop(widget.variable)
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Bitte einen Namen eingeben!"),
                          ),
                        ),
                  child: const Text("Fertig"))
            ],
          ),
          const SizedBox(height: 18.0),
          TextField(
            controller: TextEditingController()..text = widget.variable.name,
            onChanged: (value) => widget.variable.name = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(height: 12.0),
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Flexible(
                    child: DropdownMenu(
                      width: constraints.maxWidth / 2 - 4,
                      dropdownMenuEntries: Controltyp.values
                          .map(
                            (e) =>
                                DropdownMenuEntry(value: e, label: e.displayName),
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
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: DropdownMenu(
                      width: constraints.maxWidth / 2 - 4,
                      dropdownMenuEntries: widget.variable.controltyp
                          .getDatentypen()
                          .map(
                            (e) =>
                                DropdownMenuEntry(value: e, label: e.displayName),
                          )
                          .toList(),
                      onSelected: (value) => setState(
                          () => widget.variable.datentyp = value ?? Datentyp.text),
                      initialSelection: widget.variable.datentyp,
                      label: const Text("Datentyp"),
                    ),
                  ),
                ],
              );
            }
          ),
          const SizedBox(height: 12.0),
          _layoutInputs(),
        ],
      ),
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

  Widget _layoutInput(
      String label, int initialVal, Function(int value) onChanged) {
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
            enabled: false,
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
