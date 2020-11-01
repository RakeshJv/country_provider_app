
import 'package:flutter/material.dart';


class COLORS {
  // App Colors //
  static const Color DRAWER_BG_COLOR = Colors.lightGreen;


  static const Color APP_THEME_COLOR = Color.fromARGB(255, 255, 105, 180);
  static const Color PRIMARY_COLOR = Color(0xFF35B4C5);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFFA5CFF1);
  static const Color PRIMARY_COLOR_DARK = Color(0xFF0D3656);
  static const Color ACCENT_COLOR = Color(0xFFF2DA04);
  static const Color CYAN_BLUE_COLOR  = Color(0xff0D68C4);
  static const String APP_COLOR  =  "#005b8e";
  static const String APP_COLOR_SECONDARY  =  "#4682B1";
  static const String BUTTON_COLOR="#0D68C4";
  static Color hexToColor(String code)
  {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static List<Color> regionColorList=[Colors.red[900],Colors.indigo[900],Colors.deepOrange[900]
               ,Colors.teal[900],Colors.blueGrey[900],Colors.brown[900]];


  static List<Color> countryColor=[Colors.red[300],Colors.indigo[300],Colors.deepOrange[300]
    ,Colors.teal[300],Colors.blueGrey[300],Colors.brown[300]];
}