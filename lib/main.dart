import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'logic/data/enum/controltyp.dart';
import 'logic/data/enum/datentyp.dart';
import 'logic/data/formular_dto.dart';
import 'logic/data/variable_dto.dart';
import 'view/ds_next.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(FormularAdapter());
  Hive.registerAdapter(VariablenAdapter());
  Hive.registerAdapter(ControltypAdapter());
  Hive.registerAdapter(DatentypAdapter());

  runApp(const ProviderScope(child: DsNext()));
}