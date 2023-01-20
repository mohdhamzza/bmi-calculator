import 'dart:math';

class BmiCalculatorBrain {
  final int height;
  final int weight;

  late double _bmi;

  BmiCalculatorBrain({ required this.height, required this.weight});


  String calculateBmi() {
     _bmi = weight / pow(height / 100 ,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }else if(_bmi > 18.5) {
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }


  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher then your normal body weight. Try to excersice more';
    }else if(_bmi > 18.5) {
      return 'You have normal body weight. Good Job!';
    }else {
      return 'You have a lover than your normal body weight. You can eat a little bit more';
    }
  }

}