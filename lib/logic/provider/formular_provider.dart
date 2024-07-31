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
    formularBox = await Hive.openBox<FormularDto>("formularBox");
    return formularBox.toMap();
  }

  void addForm(FormularDto form) async {
    log(form.toString());
    await formularBox.add(form);

    state = AsyncData(formularBox.toMap());
  }

  void deleteForm(dynamic key) async {
    await formularBox.delete(key);

    state = AsyncData(formularBox.toMap());
  }
}