import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'view/ds_next.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const ProviderScope(child: DsNext()));
}
