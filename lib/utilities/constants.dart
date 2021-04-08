import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
  color: Colors.white,
);

const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0, color: Colors.white);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const KTestFieldDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.location_city,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
