import 'dart:math';

import 'package:common/model/monetary_amount.dart';

extension DoubleExtension on double {
  MonetaryAmount get toMonetaryAmount => MonetaryAmount.fromDouble(this);

  double roundDown(int precision) {
    final isNegative = this.isNegative;
    final mod = pow(10.0, precision);
    final roundDown = (((abs() * mod).floor()) / mod);
    return isNegative ? -roundDown : roundDown;
  }
}
