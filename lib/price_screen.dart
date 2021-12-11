import 'dart:io';

import 'package:crypto_price/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _currency = currenciesList[0];

  Widget _getPickerByPlatform() {
    if (!Platform.isAndroid) {
      return DropdownButton<String>(
        value: _currency,
        onChanged: (selectedValue) {
          setState(() {
            _currency = selectedValue ?? currenciesList[0];
          });
        },
        icon: const Icon(Icons.arrow_downward),
        items: currenciesList.map<DropdownMenuItem<String>>((currency) {
          return DropdownMenuItem(
            child: Center(
              child: Text(
                currency,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            value: currency,
          );
        }).toList(),
      );
    } else {
      return CupertinoPicker(
        itemExtent: 60,
        backgroundColor: Colors.lightBlue,
        onSelectedItemChanged: (index) {
          setState(() {
            _currency = currenciesList[index];
          });
        },
        children: currenciesList.map((currency) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              currency,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currencyPicker = _getPickerByPlatform();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          '🤑🤑 CoinX 🤑🤑',
          style: TextStyle(fontSize: 28),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: currencyPicker,
          ),
        ],
      ),
    );
  }
}
