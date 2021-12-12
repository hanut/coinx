import 'package:crypto_price/data-models/get_rate_response.dart';
import 'package:crypto_price/widgets/rate_list_item.dart';
import 'package:flutter/material.dart';

class RateList extends StatelessWidget {
  final List<GetRateResponse> rates;

  const RateList({Key? key, required this.rates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rates.isEmpty
          ? [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "No crypto rates loaded. Please select a currency",
                    style: TextStyle(color: Colors.black87, fontSize: 24),
                  ),
                ),
              ),
            ]
          : rates.map((rateItem) {
              return RateListItem(rate: rateItem);
            }).toList(),
    );
  }
}
