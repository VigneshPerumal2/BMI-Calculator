import 'dart:math';

class BMIBrain{
  final int height;
  final int weight;
  double bmi;
  BMIBrain({this.height,this.weight});

  String calculate(){
    bmi=weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }
   String getState(){
      if(bmi>=25){
        return 'Overweight';
      }
      else if(bmi>18){
        return 'Normal';
      }
      else{
        return 'Underweight';
      }
   }
  String getInterpretation(){
    if(bmi>=25){
      return 'Probably eat less.';
    }
    else if(bmi>18){
      return 'Normal, Good Job !';
    }
    else{
      return 'Probably eat more.';
    }
  }

}