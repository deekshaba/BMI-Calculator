import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

//we are passing function as object 'onPress'
  ReusableCard({@required this.colour,this.childcard,this.onPress});
  final Color colour;
  final Widget childcard;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childcard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,

        ),
      ),
    );
  }
}

