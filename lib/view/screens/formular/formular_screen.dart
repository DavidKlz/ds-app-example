import 'package:ds_next/logic/data/enum/controltyp.dart';
import 'package:ds_next/logic/data/formular_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../config/theme/ds_next_theme_utils.dart';
import '../../../logic/data/enum/datentyp.dart';
import '../../../logic/data/variablen_dto.dart';
import '../../../logic/provider/formular_provider.dart';

class FormularScreen extends ConsumerStatefulWidget {
  final dynamic formKey;

  const FormularScreen({this.formKey, super.key});

  @override
  ConsumerState<FormularScreen> createState() => _FormularScreenState();
}

class _FormularScreenState extends ConsumerState<FormularScreen> {
  FormularDto form = FormularDto(uuid: const Uuid().v1(), name: "", variablen: []);
  final TextEditingController _textEditingController = TextEditingController();
  final List<Wrap> _varInputs = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulardaten"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.watch(formularProvider.notifier).addForm(form),
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DsNextThemeUtils.getDefaultSpacing(context)),
          child: Wrap(
            runSpacing: DsNextThemeUtils.getDefaultSpacing(context),
            children: _createInputs(),
          ),
        ),
      ),
    );
  }

  List<Widget> _createInputs() {
    List<Widget> inputs = List.empty(growable: true);
    inputs.add(TextField(
      controller: _textEditingController,
      decoration: const InputDecoration(
        labelText: "Name",
      ),
    ));
    inputs.add(SizedBox(height: MediaQuery.of(context).size.height * 0.04, child: const FittedBox(fit: BoxFit.cover, child: Text("Variablen:"))));
    inputs.addAll(_varInputs);
    inputs.add(IconButton(onPressed: _addVarInput, icon: const Icon(Icons.add)));
    return inputs;
  }

  void _addVarInput() {
    setState(() {
      _varInputs.add(Wrap(
        spacing: DsNextThemeUtils.getDefaultSpacing(context),
        runSpacing: DsNextThemeUtils.getDefaultSpacing(context),
        children: [
          const Divider(),
          Container(
            constraints: const BoxConstraints(
              minWidth: 250,
              maxWidth: 500,
            ),
            child: const TextField(
              decoration: InputDecoration(
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
            label: const Text("Controltyp"),
          ),
          DropdownMenu(
            dropdownMenuEntries: Datentyp.values
                .map(
                  (e) => DropdownMenuEntry(value: e, label: e.displayName),
            )
                .toList(),
            label: const Text("Datentyp"),
          ),
        ],
      ));
    });
  }
}
