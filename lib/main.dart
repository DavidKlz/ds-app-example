import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'view/ds_next.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const DsNext());
}
