import 'package:flutter/material.dart';

mixin FontFamily {
  static const playfair = 'Playfair Display';
}

class AppStyles {
  static TextStyle h1 = TextStyle(
      fontFamily: FontFamily.playfair, fontSize: 60, color: Colors.black);
  static TextStyle h2 = TextStyle(
      fontFamily: FontFamily.playfair, fontSize: 30, color: Colors.black);
  static TextStyle h3 = TextStyle(
      fontFamily: FontFamily.playfair, fontSize: 22, color: Colors.black);
}
