import 'dart:io';

import 'package:crypto_price/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kCurrencyPickerHeight = 120.0;

class CurrencyPicker extends StatelessWidget {
  final String currency;
  final Function selectValue;

  const CurrencyPicker({
    Key? key,
    required this.currency,
    required this.selectValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Container(
        height: kCurrencyPickerHeight,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: DropdownButton<String>(
          value: currency,
          onChanged: (selectedValue) {
            selectValue(selectedValue);
          },
          dropdownColor: Colors.grey,
          iconSize: 28,
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
        ),
      );
    } else {
      return Container(
        height: kCurrencyPickerHeight,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: CupertinoPicker(
          itemExtent: 60,
          backgroundColor: Colors.lightBlue,
          onSelectedItemChanged: (index) {
            selectValue(currenciesList[index]);
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
        ),
      );
    }
  }
}
