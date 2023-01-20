import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.interpretation, required this.resultText});


  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR"
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text("Your Results",
            style: kTitleTextStyle,
            ),
                )),
          Expanded(
              flex: 5,
              child: ReUsableCard(colour: kActiveCardColour, cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                  style: kResultTextStyle,
                  ),
                  Text(bmiResult,
                  style: kBigResultTextStyle,
                  ),
                  Text(interpretation,
                  style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),),),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text("RE CALCULATE",
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
      )
    );
  }
}
