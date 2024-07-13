import 'package:flutter/material.dart';

class DsNextThemeUtils {
  DsNextThemeUtils._();

  static double getDefaultSpacing(BuildContext context) => MediaQuery.of(context).size.shortestSide * 0.02;
}