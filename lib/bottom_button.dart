import 'package:flutter/material.dart';
import 'constants.dart';


class bottombutton extends StatelessWidget {

  bottombutton({@required this.ontap,@required this.buttonTitle});

  final Function ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text( buttonTitle,
            style: klargetextstyle,),
        ),
        color: kBottoncontainercolor,
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomcontainerheight,
      ),
    );
  }
}
