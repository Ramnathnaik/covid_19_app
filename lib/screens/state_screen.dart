import 'package:covid_19_tracker/consts.dart';
import 'package:covid_19_tracker/covid_data.dart';
import 'package:covid_19_tracker/widgets/statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class StateScreen extends StatefulWidget {


  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {

  String selectedDistrict = "Uttara Kannada";
  String affected = '?';
  String deaths = '?';
  String recovered = '?';
  String active = '?';
  String lastUpdatedTime = '?';
  bool isTotal = true;
  bool showProgressbar = false;
  CovidNationalData data = CovidNationalData();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String district in districts) {
      var newItem = DropdownMenuItem(
        child: Text(district),
        value: district,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedDistrict,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedDistrict = value;
          getData();
        });
      },
    );
  }

  void getData() async {
    isTotal = true;
    setState(() {
      showProgressbar = true;
    });
    List<dynamic> resultData = await data.getCovidDistrictData(selectedDistrict);
    setState(() {
      affected = resultData[0].toString();
      deaths = resultData[1].toString();
      recovered = resultData[2].toString();
      active = resultData[3].toString();
      lastUpdatedTime = resultData[4];
      showProgressbar = false;
    });
  }

  void getTodayData() async {
    isTotal = false;
    setState(() {
      showProgressbar = true;
    });
    List<int> resultData = await data.getCovidDistrictTodayData(selectedDistrict);
    setState(() {
      affected = resultData[0].toString();
      deaths = resultData[1].toString();
      recovered = resultData[2].toString();
      active = resultData[3].toString();
      showProgressbar = false;
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showProgressbar,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Color(0xff6200EE),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 60.0),
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'Statistics',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Hero(
                      tag: 'countryContainer',
                      child: Container(
                          width: 200.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [kShadowEffect],
                          ),
                          child: Center(
                            child: Text(
                              selectedDistrict,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      getData();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      decoration: isTotal ? BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [kShadowEffect]
                      ) : null,
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: isTotal ? Colors.black : Colors.white54
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      getTodayData();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      decoration: isTotal ? null : BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [kShadowEffect]
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: isTotal ? Colors.white54 : Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 35.0, bottom: 25.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                      boxShadow: [kBoxShadowEffect]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'last updated time $lastUpdatedTime',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              StatisticsCard(
                                color: Colors.orange[500],
                                cardLabel: 'Affected',
                                cardValue: affected,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              StatisticsCard(
                                color: Colors.red[500],
                                cardLabel: 'Death',
                                cardValue: deaths,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              StatisticsCard(
                                color: Colors.green[500],
                                cardLabel: 'Recovered',
                                cardValue: recovered,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              StatisticsCard(
                                color: Colors.blue[500],
                                cardLabel: 'Active',
                                cardValue: active,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 50.0,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [kGreyShadowEffect]
                        ),
                        child: androidDropdown(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
