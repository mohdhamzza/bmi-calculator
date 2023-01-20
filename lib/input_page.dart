import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';


enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

     Gender? SelectedCardColour;
     int height = 180;
     int weight = 50;
     int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(onTap: (){
                 setState(() {
                   SelectedCardColour = Gender.male;
                 }
                 );
              },
                child: ReUsableCard(
                  colour: SelectedCardColour == Gender.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(
                  icons: FontAwesomeIcons.mars,
                  label: "MALE",
                ),
                ),
              ),
              ),
              Expanded(child: GestureDetector(onTap: (){
                setState(() {
                 SelectedCardColour = Gender.female;
                }
                );
              },
                child: ReUsableCard(
                    colour: SelectedCardColour == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                  icons: FontAwesomeIcons.venus,
                  label: "FEMALE",
                ),
                ),
                ),
               ),
            ]
          ),
          ),
          Expanded(child: ReUsableCard(colour: kActiveCardColour, cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),
                  style: kBigTextStyle,
                  ),
                  Text("cm",
                  style: kLabelTextStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xffeb1555),
                  overlayColor: Color(0x29eb1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0)
                ),
                child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue){
                     setState(() {
                       height = newValue.round();
                     });
                    }),
              ),
            ],
          ),

          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReUsableCard(colour: kActiveCardColour, cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Weight",
                  style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kBigTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     RoundIconButton(icon: FontAwesomeIcons.minus,
                     onPressed: (){
                       setState(() {
                         weight--;
                       });
                     },
                     ),
                      SizedBox(width: 10.0,),
                     RoundIconButton(icon: FontAwesomeIcons.plus,
                     onPressed: (){
                       setState(() {
                         weight++;
                       });
                     },
                     )
                    ],
                  )
                ],
              ),
              ),
              ),
              Expanded(child: ReUsableCard(colour: kActiveCardColour, cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Age",
                  style: kLabelTextStyle,),
                  Text(age.toString(),
                  style: kBigTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                        setState(() {
                          age--;
                        });
                      }),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                        setState(() {
                          age++;
                        });
                      })
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
             BmiCalculatorBrain calc = BmiCalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return ResultPage(
                  bmiResult: calc.calculateBmi(),
                  interpretation: calc.getInterpretation(),
                  resultText: calc.getResult(),
                );
              }
              ));

            },
            child: Container(
              child: Center(
                child: Text("CALCULATE",
                style: kLargeTextStyle,
                ),
              ),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}








