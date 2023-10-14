import 'dart:convert';
import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final url;
  final apiKey;

  CoinData(this.url, this.apiKey);

  Future getData() async {
    final response = await http.get(Uri.parse(url), headers: {'X-CoinAPI-Key': apiKey});
    if (response.statusCode == 200) {
      var coinData = jsonDecode(response.body);
      return coinData;
    }
    else {
      print('Error in request. HTTP Code: ${response.statusCode}');
    }
  }
}
