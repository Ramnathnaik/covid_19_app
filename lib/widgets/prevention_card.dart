import 'package:flutter/material.dart';
import 'package:covid_19_tracker/consts.dart';

class PreventionCard extends StatelessWidget {

  final String imageUrl;
  final String textLabel;

  PreventionCard({@required this.imageUrl, @required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffEFEEFD),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          boxShadow: [kGreyShadowEffect],
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              textLabel,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}