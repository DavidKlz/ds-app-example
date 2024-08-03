import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/formular_dto.dart';

part 'formular_provider.g.dart';

@riverpod
class Formular extends _$Formular {
  late Box<FormularDto> formularBox;

  @override
  Future<Map<dynamic, FormularDto>> build() async {
    formularBox = await Hive.openBox("formularBox");
    return formularBox.toMap();
  }

  void saveForm(FormularDto form) async {
    await formularBox.put(form.uuid, form);

    state = AsyncData(formularBox.toMap());
  }

  void deleteForm(dynamic key) async {
    await formularBox.delete(key);

    state = AsyncData(formularBox.toMap());
  }
}
