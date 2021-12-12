import 'package:crypto_price/network.dart';
import 'package:test/test.dart';

void main() {
  group("Network Tests", () {
    test(
        "getRate() should return the rate of the given script in the given currency",
        () async {
      await getRate(script: "ETH", currency: "USD");
    });
  });
}
