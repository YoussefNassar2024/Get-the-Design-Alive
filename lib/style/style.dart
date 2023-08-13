import 'package:flutter/material.dart';

class CustomStyle {
  static final _ColorPalette colorPalette = _ColorPalette();
  static final _FontSizes fontSizes = _FontSizes();
  static final fontFamily = 'BalsamiqSans';
}

class _ColorPalette {
//write your colors here
  Color appBar = Color(0x0FFdfe0df);
  Color fontColor = Color.fromARGB(221, 172, 172, 172);
  Color petLoveScore = Color(0xFFdb6400);
  Color petType = Color(0xFFcbcbcb);
}

class _FontSizes {
  //write common font size here
  double titleAppbar = 30;
  double hintTextSearch = 22;
  double petName = 22;
  double petType = 15;
  double petlove = 15;
}
