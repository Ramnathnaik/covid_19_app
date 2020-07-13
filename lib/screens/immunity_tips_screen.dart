import 'package:covid_19_tracker/consts.dart';
import 'package:covid_19_tracker/widgets/tip_card.dart';
import 'package:flutter/material.dart';

class ImmunityTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Get enough sleep',
                        tipCardBody: 'Sleep and immunity are closely tied. In fact, inadequate or poor '
                            'quality sleep is linked to a higher susceptibility to sickness.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Eat more healthy fats',
                        tipCardBody: 'Healthy fats, like those found in olive oil and salmon, '
                            'may boost your body’s immune response to pathogens by decreasing inflammation.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Engage in moderate exercise',
                        tipCardBody: 'Although prolonged intense exercise can suppress your '
                            'immune system, moderate exercise can give it a boost.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Stay hydrated',
                        tipCardBody: 'Hydration doesn’t necessarily protect you from germs and viruses,'
                            ' but preventing dehydration is important to your overall health.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Manage your stress levels',
                        tipCardBody: 'Activities that may help you manage your stress include '
                            'meditation, exercise, journaling, yoga, and other mindfulness practices.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Manage your stress levels',
                        tipCardBody: 'Activities that may help you manage your stress include '
                            'meditation, exercise, journaling, yoga, and other mindfulness practices.',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TipCard(
                        tipCardLabel: 'Attitude is everything',
                        tipCardBody: 'A positive mindset is vital for health and well-being. Research shows that positive thoughts '
                            'reduce stress and inflammation and increase resilience to infection',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




