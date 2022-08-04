import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconcontent.dart';
import 'reusable.dart';
import 'ndpage.dart';
import 'constants.dart';
import 'bmi.dart';

const activeCardcolor = Color(0xFF1D1E33);
const inactiveCardcolor = Color(0xFF111328);
const ktt = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const klabel = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

enum Gender {
  male,
  female,
  xxx,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender SelectedGender = Gender.xxx;
  Color maleCardColour = inactiveCardcolor;
  Color femaleCardColour = inactiveCardcolor;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    // updateColor(1);
                    setState(() {
                      SelectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: SelectedGender == Gender.male
                        ? activeCardcolor
                        : inactiveCardcolor,
                    cardChild: Cc(icon: FontAwesomeIcons.mars, txt: 'Male'),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      SelectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: SelectedGender == Gender.female
                        ? activeCardcolor
                        : inactiveCardcolor,
                    cardChild: Cc(icon: FontAwesomeIcons.venus, txt: 'FeMale'),
                  ),
                )),
              ],
            )),
            Expanded(
              child: ReusableCard(
                  colour: activeCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: ktt,
                          ),
                          Text(
                            'cm',
                            style: klabel,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlappingShapeStrokeColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          // activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: activeCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: klabel,
                      ),
                      Text(
                        weight.toString(),
                        style: ktt,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn2",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: "btn1",
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ]),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: activeCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: klabel,
                      ),
                      Text(
                        age.toString(),
                        style: ktt,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: "btn3",
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            heroTag: "btn4",
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                Calculator calc=Calculator(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  // ignore: prefer_const_constructors
                  return ResultsPage(calc.CalculateBMI(),calc.getResult(),calc.getResul2t());
                }));
              },
              child: Container(
                child: Center(
                    child: Text(
                  'CALCULATE',
                  style: klarge,
                )),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ],
        ));
    // floatingActionButton: FloatingActionButton(
    //   child: Icon(Icons.add),
    // ),
  }
}
