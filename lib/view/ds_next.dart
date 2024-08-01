import 'package:flutter/material.dart';

import '../config/router/ds_next_router.dart';

class DsNext extends StatelessWidget {
  const DsNext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: DsNextRouter.onGenerateRoute,
    );
  }
}
