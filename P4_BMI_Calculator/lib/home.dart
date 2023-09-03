import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'design.dart';
import 'calculator.dart';
import 'results_page.dart';


const Color kInactiveCardColor = Color(0XFF111328);
const Color kActiveCardColor = Color(0XFF1D1E33);

enum Gender { Male, Female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender? selectedGender;
  int height = 120;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CardWidget(
                  bgColor: selectedGender == Gender.Male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  content: IconContent('MALE', FontAwesomeIcons.mars),
                  tapAction: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                ),
              ),
              Expanded(
                child: CardWidget(
                    bgColor: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    content: IconContent('FEMALE', FontAwesomeIcons.venus),
                    tapAction: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    }),
              ),
            ],
          )),
          Expanded(
            child: CardWidget(
              bgColor: kInactiveCardColor,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kmainTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(fontSize: 50.0),
                      ),
                      Text(
                        ' cm',
                        style: kmainTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
              tapAction: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    bgColor: kInactiveCardColor,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kmainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: TextStyle(fontSize: 50.0),
                            ),
                            Text(
                              ' kg',
                              style: kmainTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    tapAction: () {},
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    bgColor: kInactiveCardColor,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kmainTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(fontSize: 50.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age < 100 ? age++ : age;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age > 18 ? age-- : age;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    tapAction: () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 60,
              color: Color(0XFFEB1555),
              child: Center(
                  child: Text(
                'CALCULATE',
                style: kMainButtonStyle,
              )),
            ),
            onTap: () {
              Calculator calc = Calculator(height, weight);
              calc.calculateBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(calculator: calc,);
              }));
            },
          ),
        ],
      ),
    );
  }
}
