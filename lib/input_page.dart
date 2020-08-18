import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'RoundIconButton.dart';
import 'calculating_brain.dart';

enum Gender {male,female }


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height=180;
  int weight=60;
  int age=18;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male ? kActivecardcolor:kInactivecardcolor,
                      childcard: IconContent(icon: FontAwesomeIcons.mars
                        ,label: 'MALE',
                      ),
                    ),


                  ),
                  Expanded(
                      child:
                      ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedgender = Gender.female;
                          });
                        },
                        colour: selectedgender == Gender.female ? kActivecardcolor:kInactivecardcolor,
                        childcard: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),)
                  )
                ],
              ),
            ),
            Expanded(
                child:
                ReusableCard(
                  colour: kActivecardcolor,
                  childcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                        style: labeltextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //to make entire text align on same line
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                              style: knumbertextstyle
                          ),
                          Text('cm',
                            style: labeltextstyle,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newvalue){
                            setState(() {
                              height=newvalue.round();
                            });

                          },
                        ),
                      ),
                    ],
                  ),
                )

            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:
                      ReusableCard(
                        colour: kActivecardcolor,
                        childcard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',
                              style: labeltextstyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knumbertextstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },)
                              ],
                            ),
                          ],
                        ),)
                  ),
                  Expanded(
                      child: ReusableCard(
                        colour: kActivecardcolor,
                        childcard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE',
                              style: labeltextstyle,),
                            Text(
                              age.toString(),
                              style: knumbertextstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icon: FontAwesomeIcons.minus,
                                  onpressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(icon: FontAwesomeIcons.plus,
                                  onpressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },)
                              ],
                            )
                          ],
                        ),
                      )

                  )
                ],
              ),
            ),
            bottombutton(ontap: (){

              Calculatorbrain calc = Calculatorbrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(
                bmiresult: calc.calculateBMI(),
                resulttext: calc.getresult(),
                interpretation: calc.getInterpretation(),
              )));
            },buttonTitle: 'CALCULATE',),
          ],
        )

    );
  }
}


