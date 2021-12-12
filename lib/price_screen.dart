import 'package:crypto_price/coin_data.dart';
import 'package:crypto_price/data-models/get_rate_response.dart';
import 'package:crypto_price/network.dart';
import 'package:crypto_price/widgets/currency_picker.dart';
import 'package:crypto_price/widgets/rate_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _currency = currenciesList[0];
  bool _isLoading = true;
  List<GetRateResponse> _rates = [];

  @override
  void initState() {
    super.initState();
    getRateForAllScripts();
  }

  void getRateForAllScripts({bool showLoader = false}) async {
    if (showLoader) {
      setState(() {
        _isLoading = true;
      });
    }
    List<GetRateResponse> rates = [];
    try {
      for (var script in cryptoList) {
        var tmp = await getRate(script: script, currency: _currency);
        rates.add(tmp);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 3),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
      _rates = rates;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          '🤑🤑 CoinX 🤑🤑',
          style: TextStyle(fontSize: 28),
        )),
      ),
      body: Column(
        mainAxisAlignment: _isLoading
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _isLoading
            ? [
                const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                      strokeWidth: 5,
                    ),
                  ),
                ),
              ]
            : <Widget>[
                RateList(rates: _rates),
                CurrencyPicker(
                  currency: _currency,
                  selectValue: (String selectedValue) {
                    setState(() {
                      _currency = selectedValue;
                    });
                    getRateForAllScripts(showLoader: true);
                  },
                ),
              ],
      ),
    );
  }
}
