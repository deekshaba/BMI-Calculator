import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'input_page.dart';
import 'bottom_button.dart';

class Resultpage extends StatelessWidget {

  Resultpage({@required this.bmiresult,@required this.resulttext,@required this.interpretation});


  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitletextstyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(colour: kActivecardcolor,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resulttext.toUpperCase(),
                      style: kresulttextstyle,),
                    Text(
                      bmiresult,
                      style: kBMItextstyle,
                    ),
                    Text(
                      interpretation,
                      style: kbodytextstyle,
                      textAlign: TextAlign.center,
                    )
                  ],

                ),),
            ),
            bottombutton(ontap:(){
              Navigator.pop(context);
            },buttonTitle: 'RE-CALCULATE',)

          ],
        )
    );
  }
}
