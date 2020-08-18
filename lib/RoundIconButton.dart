import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onpressed});

  final IconData icon;
  Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
    );
  }
}
