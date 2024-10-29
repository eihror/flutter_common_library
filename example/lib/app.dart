import 'package:common/model/monetary_amount.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final monetaryAmount = MonetaryAmount.fromDouble(11230.43);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Monetary Amount in BRL",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  monetaryAmount.currencyFormat(hasSymbol: true),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Monetary Amount in USD",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  monetaryAmount.currencyFormat(
                    locale: Locale('en', 'US'),
                    hasSymbol: true,
                  ),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Monetary Amount in EUR",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  monetaryAmount.currencyFormat(
                    locale: Locale('de', 'DE'),
                    hasSymbol: true,
                  ),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
