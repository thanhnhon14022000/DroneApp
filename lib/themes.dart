// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import '/value/app_fonts.dart';
var lightThemeData = new ThemeData(
    primaryColor: Colors.black,
    //textTheme: new TextTheme(button: TextStyle(color: Colors.white70)),
    textTheme: TextTheme(),
    brightness: Brightness.light,
    accentColor: Color.fromARGB(255, 82, 243, 243),
    
    );

var darkThemeData = ThemeData(
    primaryColor: Color.fromARGB(255, 87, 211, 233),
    //textTheme: new TextTheme(button: TextStyle(color: Colors.black54)),
    brightness: Brightness.dark,
    accentColor: Colors.black,
    );
