import 'dart:ui';

import 'package:common/extension/double_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class MonetaryAmount implements Comparable<MonetaryAmount> {
  static final ZERO = MonetaryAmount(amount: Decimal.zero);
  static const int DECIMAL_PLACES = 2;
  static const int _ONE_HUNDRED = 100;

  final Decimal amount;

  MonetaryAmount({
    required this.amount,
  });

  factory MonetaryAmount.fromDouble(double amount) {
    return MonetaryAmount(amount: Decimal.parse(amount.toString()));
  }

  factory MonetaryAmount.fromFloat(double amount) {
    return MonetaryAmount(amount: Decimal.parse(amount.toString()));
  }

  factory MonetaryAmount.fromString(String amount) {
    return MonetaryAmount(amount: Decimal.parse(amount));
  }

  factory MonetaryAmount.fromCents(int amountInCents) {
    return MonetaryAmount(amount: Decimal.fromInt(amountInCents));
  }

  MonetaryAmount operator +(MonetaryAmount other) {
    final newAmount = amount + other.amount;
    return MonetaryAmount(amount: newAmount);
  }

  MonetaryAmount operator -(MonetaryAmount other) {
    final newAmount = amount - other.amount;
    return MonetaryAmount(amount: newAmount);
  }

  MonetaryAmount operator /(int number) {
    return div(number);
  }

  MonetaryAmount divRemainder(int number) {
    final amountInCents = inCents();
    final newAmount = amountInCents.remainder(number);
    final newAmountInCents = newAmount / _ONE_HUNDRED;
    return MonetaryAmount.fromDouble(newAmountInCents);
  }

  MonetaryAmount div(int number) {
    final amountInCents = inCents();
    final newAmount = (amountInCents / number).roundDown(0);
    final newAmountInCents = newAmount / _ONE_HUNDRED;
    return MonetaryAmount.fromDouble(newAmountInCents);
  }

  MonetaryAmount operator *(int number) {
    final newAmount = amount * Decimal.fromInt(number);
    return MonetaryAmount(amount: newAmount);
  }

  bool operator >(MonetaryAmount other) {
    return amount > other.amount;
  }

  bool operator <(MonetaryAmount other) {
    return amount < other.amount;
  }

  @override
  int compareTo(MonetaryAmount other) {
    return amount.compareTo(other.amount);
  }

  @override
  bool operator ==(Object other) {
    if (other is! MonetaryAmount) {
      return false;
    }
    return amount == other.amount;
  }

  @override
  int get hashCode {
    return amount.hashCode;
  }

  int inCents() {
    final Decimal amountInCents = (amount * Decimal.fromInt(_ONE_HUNDRED));
    return amountInCents.toBigInt().toInt();
  }

  String currencySymbol({
    Locale locale = const Locale('pt', 'BR'),
  }) {
    final NumberFormat currency = NumberFormat.simpleCurrency(
      locale: locale.languageCode,
    );
    return currency.currencySymbol;
  }

  String currencyFormat({
    String pattern = "#,##0.00",
    Locale locale = const Locale('pt', 'BR'),
    bool hasSymbol = false,
  }) {
    final numberFormat = NumberFormat(pattern, locale.languageCode);
    final value = numberFormat.format(amount.toDouble());
    late String result;
    if (hasSymbol) {
      result = "${currencySymbol(locale: locale)} $value";
    } else {
      result = value;
    }
    return result;
  }
}
