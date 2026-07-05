import 'package:flutter/material.dart';

class TaxDimens {
  TaxDimens._();

  static const double designWidth = 393.0;

  static double scale(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w / designWidth;
  }

  static double v(BuildContext context, double value) => value * scale(context);
}
