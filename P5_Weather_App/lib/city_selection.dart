import 'package:flutter/material.dart';
import 'design.dart';

class CitySelection extends StatelessWidget {
  const CitySelection({super.key});

  @override
  Widget build(BuildContext context) {
    var txtVal;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/city_select_bg.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white70,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(width:80,),
                  Text(
                    'Weather by City',
                    style: kHeaderTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 200,
              ),
              SizedBox(height: 60.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_city_sharp),
                      labelText: 'City name'),
                  onChanged: (text) {
                    txtVal = text;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context, txtVal);
                },
                child: Text(
                  'OK',
                  style: kButtonTextStyle,
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black26),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
