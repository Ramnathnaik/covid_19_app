import 'package:flutter/material.dart';

class BottomButtonContainer extends StatelessWidget {

  final Color color;
  final String textLabel;
  final Function onPress;

  BottomButtonContainer({this.color, this.textLabel, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: color)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text(
            textLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}