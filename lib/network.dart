import 'dart:convert';

import 'package:crypto_price/data-models/get_rate_response.dart';
import 'package:http/http.dart' as http;

const apiKey = "534B8D98-D0DB-4A4E-84F1-3E3F93158214";
const baseUrl = 'https://rest-sandbox.coinapi.io';

Future<dynamic> getRate({
  required String script,
  required String currency,
}) async {
  var epUrl = Uri.parse(baseUrl + "/v1/exchangerate/$script/$currency");
  var res = await http.get(
    epUrl,
    headers: {
      'X-CoinAPI-Key': apiKey,
    },
  );
  if (res.statusCode != 200) {
    if (res.statusCode == 550) {
      return Future.error(
          "You requested to exchange in an unsupported currency");
    }
    return Future.error(res.body.toString());
  }
  var data = json.decode(res.body.toString());
  return GetRateResponse(data['time'], data['asset_id_base'],
      data['asset_id_quote'], data['rate']);
}
