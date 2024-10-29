import 'package:common/model/monetary_amount.dart';

extension StringExtension on String {
  MonetaryAmount get toMonetaryAmount => MonetaryAmount.fromString(this);
}
