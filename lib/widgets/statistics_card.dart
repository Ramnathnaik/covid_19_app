import 'package:covid_19_tracker/consts.dart';
import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {

  final String cardLabel;
  final String cardValue;
  final Color color;

  StatisticsCard({this.color, this.cardValue, this.cardLabel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 125.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [kGreyShadowEffect]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              cardLabel,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white
              ),
            ),
            Text(
              cardValue,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22.0,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
