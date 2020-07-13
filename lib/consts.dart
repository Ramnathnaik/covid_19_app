import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.deepPurple;

const kShadowEffect = BoxShadow(
  color: Colors.black,
  offset: Offset(0.0, 1.0), //(x,y)
  blurRadius: 1.0,
);

const kBoxShadowEffect = BoxShadow(
  color: Colors.black,
  offset: Offset(1.0, 0.0), //(x,y)
  blurRadius: 2.0,
);

const kGreyShadowEffect = BoxShadow(
  color: Colors.grey,
  offset: Offset(0.0, 1.0), //(x,y)
  blurRadius: 1.0,
);