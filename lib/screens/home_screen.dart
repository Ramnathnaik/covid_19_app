import 'package:covid_19_tracker/screens/country_data_screen.dart';
import 'package:covid_19_tracker/screens/immunity_tips_screen.dart';
import 'package:covid_19_tracker/screens/state_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/consts.dart';
import 'package:covid_19_tracker/widgets/bottom_button_container.dart';
import 'package:covid_19_tracker/widgets/prevention_card.dart';
import 'package:connectivity/connectivity.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Container(
                height: 200.0,
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(35.0), bottomLeft: Radius.circular(40.0)),
                  boxShadow: [kShadowEffect],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TypewriterAnimatedTextKit(
                      text: ['Covid-19'],
                      textStyle: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                      totalRepeatCount: 1,
                      speed: Duration(milliseconds: 500),
                    ),
                    Hero(
                      tag: 'countryContainer',
                      child: Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [kShadowEffect],
                        ),
                        child: Center(
                          child: Text(
                            'India',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Prevention',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          PreventionCard(
                            imageUrl: 'images/socialDistancing.png',
                            textLabel: 'Avoid close\ncontact',
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          PreventionCard(
                            imageUrl: 'images/washHands.png',
                            textLabel: 'Clean your\nhands often',
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          PreventionCard(
                            imageUrl: 'images/wearMask.png',
                            textLabel: 'Wear a\nface mask',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 150.0,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                          boxShadow: [kGreyShadowEffect]
                      ),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ImmunityTipsScreen())
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                'images/health.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Center(
                              child: Text(
                                'Tips to\nincrease\nimmunity',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 70.0,
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 10.0),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomButtonContainer(
                      textLabel: 'Country Data',
                      color: kPrimaryColor,
                      onPress: () async {
                        var connectivityResult = await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.none) {
                          Alert(context: context, title: "Internet Issue", desc: "Please check the internet connectivity", style: AlertStyle(backgroundColor: Colors.white)).show();
                        } else if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CountryScreen())
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    BottomButtonContainer(
                      textLabel: 'State Data',
                      color: Color(0xff6C63FF),
                      onPress: () async {
                        var connectivityResult = await (Connectivity().checkConnectivity());
                        if (connectivityResult == ConnectivityResult.none) {
                          Alert(context: context, title: "Internet Issue", desc: "Please check the internet connectivity", style: AlertStyle(backgroundColor: Colors.white)).show();
                        } else if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StateScreen())
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}





