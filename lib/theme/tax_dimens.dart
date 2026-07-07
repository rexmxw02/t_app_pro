import 'package:flutter/material.dart';

class TaxDimens {
  TaxDimens._();
  static const double designWidth = 393.0;
  static double scale(BuildContext context) => MediaQuery.of(context).size.width / designWidth;
}
