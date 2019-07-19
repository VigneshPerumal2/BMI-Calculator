import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'constants.dart';
import 'bmiBrain.dart';
class Results extends StatelessWidget {
  @override
  String state,bmi,inter;
  Results({this.state,this.bmi,this.inter});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('BMI')),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Your Results',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900
            ),
            ),
            Expanded(child: ReusableCard(colour:0xFF1D1F33,
            Child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(state,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900
                ),
                  textAlign: TextAlign.center ,
                ),
              Text(bmi,style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w900,
              ),
                  textAlign: TextAlign.center),
              Text(inter,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900
              ),
                  textAlign: TextAlign.center),
              ],
            ) ,
            )),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: kBottomButtonHeight,
                color: Color(0xFFEA1556),
                child: Center(
                  child: Text('RE-CALCULATE YOUR BMI',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
