import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/ReusableCard.dart';
import 'package:bmi/Gender.dart';
import 'constants.dart';
import 'bmiBrain.dart';
import 'results.dart';
enum sex { male, female }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int maleCardColor = kInactiveColor;
  int femaleCardColor = kInactiveColor;
  sex value;
  int height = 160;
  int weight = 40;
  int age=12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour:
                            sex.male == value ? kActiveColor : kInactiveColor,
                        Child: Gender(x: FontAwesomeIcons.mars, label: 'MALE'),
                        sex: () {
                          setState(() {
                            value = sex.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour:
                          sex.female == value ? kActiveColor : kInactiveColor,
                      Child: Gender(x: FontAwesomeIcons.venus, label: 'FEMALE'),
                      sex: () {
                        setState(() {
                          value = sex.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveColor,
                Child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kWTstyle,
                        ),
                        Text(
                          'cm',
                          style: kTstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(kInactiveColor),
                          thumbColor: Color(0xFFEA1556),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0x1fEA1556)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      Child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kTstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(weight.toString(), style: kWTstyle),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Kg',
                                style: kTstyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButtons(
                                  icon: FontAwesomeIcons.minus,
                                  oncl: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  }),
                              SizedBox(
                                width: 6.0,
                              ),
                              RoundButtons(
                                  icon: FontAwesomeIcons.plus,
                                  oncl: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveColor,
                      Child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kTstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(age.toString(), style: kWTstyle),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'yrs',
                                style: kTstyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButtons(
                                  icon: FontAwesomeIcons.minus,
                                  oncl: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  }),
                              SizedBox(
                                width: 6.0,
                              ),
                              RoundButtons(
                                  icon: FontAwesomeIcons.plus,
                                  oncl: () {
                                    setState(() {
                                      age = age + 1;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                BMIBrain brain=BMIBrain(height: height,weight: weight);
                brain.calculate();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Results(state: brain.getState(),bmi: brain.calculate(),inter: brain.getInterpretation(),)));
              },
              child: Container(
                width: double.infinity,
                height: kBottomButtonHeight,
                color: Color(0xFFEA1556),
                child: Center(
                  child: Text('CALCULATE YOUR BMI',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundButtons extends StatelessWidget {
  final IconData icon;
  final Function oncl;

  RoundButtons({@required this.oncl, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: oncl,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF6F717A),
      shape: CircleBorder(),
    );
  }
}
