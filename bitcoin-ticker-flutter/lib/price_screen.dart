import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'exhange_rate.dart';
import 'currency_card.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String readySelectedCurrency = 'USD';

  Map<String, String> rates = {
    'BTC': null,
    'ETH': null,
    'LTC': null,
  };

  void updateRates() async {
    for (String asset in rates.keys) {
      String result = await getRate(asset, selectedCurrency);
      print(result);
      rates[asset] = result;
    }
    readySelectedCurrency = selectedCurrency;
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    updateRates();
  } 

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      items: currenciesList
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        updateRates();
        });
      },
      value: selectedCurrency,
      hint: Text(
        'Currency',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      dropdownColor: Colors.white,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      children: currenciesList
          .map(
            (value) => Text(value),
          )
          .toList(),
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: rates.keys.map(
              (asset) => CurrencyCard(
                asset: asset,
                currency: readySelectedCurrency,
                rate: rates[asset] ?? '?',
              ),
            ).toList(),
          ),
          // Center(child: Text(selectedCurrency, style: TextStyle(color: Colors.black,))),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Center(
              child: Platform.isAndroid ? androidDropdown() : iOSPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
