import 'package:ds_next/logic/data/enum/controltyp.dart';
import 'package:ds_next/logic/data/formular_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../config/router/ds_next_routes.dart';
import '../../../config/theme/ds_next_theme_utils.dart';
import '../../../logic/data/variable_dto.dart';
import '../../../logic/provider/formular_provider.dart';
import 'widgets/formular_variablen_input.dart';

class FormularScreen extends ConsumerStatefulWidget {
  final FormularDto? form;

  const FormularScreen({this.form, super.key});

  @override
  ConsumerState<FormularScreen> createState() => _FormularScreenState();
}

class _FormularScreenState extends ConsumerState<FormularScreen> {
  FormularDto form =
      FormularDto(uuid: const Uuid().v1(), name: "", variablen: []);
  final List<FormularVariablenInput> _varInputs = List.empty(growable: true);
  final List<VariableDto> vars = List.empty(growable: true);
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.form != null) {
      form = widget.form!;
    }
    controller.text = form.name;
    form.variablen.forEach(
      (element) => _varInputs.add(
        FormularVariablenInput(
          variable: element,
          onRemove: _removeVariable,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulardaten"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                DsNextRoutes.formBuilder,
                arguments: form),
            icon: const Icon(Icons.build),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          form.variablen = _varInputs
              .map(
                (e) => e.variable,
              )
              .toList();
          ref.watch(formularProvider.notifier).saveForm(form);
        },
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DsNextThemeUtils.getDefaultSpacing(context)),
          child: Column(
            children: [
              Wrap(
                runSpacing: DsNextThemeUtils.getDefaultSpacing(context),
                children: _createInputs(),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _addVarInput,
                label: const Text("Variable hinzufügen"),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createInputs() {
    List<Widget> inputs = List.empty(growable: true);
    inputs.add(TextField(
      controller: controller,
      onChanged: (value) => form.name = value,
      decoration: const InputDecoration(
        labelText: "Name",
      ),
    ));
    inputs.add(SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
        child: const FittedBox(fit: BoxFit.cover, child: Text("Variablen:"))));
    inputs.addAll(_varInputs);
    return inputs;
  }

  void _removeVariable(VariableDto variable) {
    setState(() {
      _varInputs.removeWhere((element) => element.variable == variable,);
      if(form.variablen.contains(variable)) {
        form.variablen.remove(variable);
      }
    });
  }

  void _addVarInput() {
    setState(() {
      _varInputs.add(FormularVariablenInput(onRemove: _removeVariable,));
    });
  }
}
