import 'package:covid_19_tracker/consts.dart';
import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {

  final String tipCardLabel;
  final String tipCardBody;

  TipCard({this.tipCardBody, this.tipCardLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [kShadowEffect]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tipCardLabel,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
            tipCardBody,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}