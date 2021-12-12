import 'package:crypto_price/data-models/get_rate_response.dart';
import 'package:flutter/material.dart';

class RateListItem extends StatelessWidget {
  final GetRateResponse rate;

  const RateListItem({
    Key? key,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${rate.script} = ${rate.rate.toStringAsFixed(2)} ${rate.currency}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
