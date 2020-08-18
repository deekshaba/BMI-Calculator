import 'dart:math';

class Calculatorbrain{

  Calculatorbrain({this.height,this.weight});

  final int height;
  final int weight;

  double _BMI;

  String calculateBMI(){
    _BMI = weight / pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getresult(){

    if(_BMI > 30){
      return 'obese';
    } else if(_BMI >= 25 && _BMI <=30){
      return 'overweight';
    }else if(_BMI > 18.5 && _BMI < 25){
      return 'Normal';
    }else {
      return 'underweight';
    }
  }

  String getInterpretation(){
    if(_BMI > 30){
      return 'You have 20% more than ideal body weight. Try to exercise more and maintain your diet.';
    } else if(_BMI >= 25 && _BMI <=30){
      return 'You have higher than normal body weight. Try to exercise more.';
    }else if(_BMI > 18.5 && _BMI < 25){
      return 'You have a normal body weight. Good job!';
    }else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }

  }


}