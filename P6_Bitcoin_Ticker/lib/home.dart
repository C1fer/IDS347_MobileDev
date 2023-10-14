import 'package:flutter/material.dart';
import 'conversion_info.dart';
import 'coin_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var conversions = {"BTC": "", "ETH": "", "LTC": ""};

  String selectedCurrency = currenciesList[0];

  void getConversions() async {
    for (String coin in cryptoList) {
      String url =
          "https://rest.coinapi.io/v1/exchangerate/$coin/$selectedCurrency";
      CoinData c = CoinData(url, '{API Key Here}');
      var data = await c.getData();
      setState(() {
        var conversion = data["rate"].round();
        conversions[coin] = conversion.toString();
      });
    }
  }

  @override
  void initState() {
    getConversions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffefeff),
        appBar: AppBar(
          title: Text('🤑 Coin Ticker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            ConversionInfo(
                coin: "BTC",
                currency: selectedCurrency,
                conversion: conversions["BTC"] ?? '?'),
            ConversionInfo(
                coin: "ETH",
                currency: selectedCurrency,
                conversion: conversions["ETH"] ?? '?'),
            ConversionInfo(
                coin: "LTC",
                currency: selectedCurrency,
                conversion: conversions["LTC"] ?? '?'),
            SizedBox(height: 350),
            Expanded(
              child: Container(
                color: Color(0xff01a8f5),
                height: 250,
                alignment: Alignment.center,
                child: DropdownButton(
                    value: selectedCurrency,
                    items: currenciesList.map((String currency) {
                      return DropdownMenuItem(value: currency, child: Text(currency));
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        selectedCurrency = newVal ?? '';
                        getConversions();
                      });
                    },
                  underline:SizedBox() ,
                    ),
              ),
            ),
          ],
        ));
  }
}
