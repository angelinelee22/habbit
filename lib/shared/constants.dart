import 'package:flutter/material.dart';

const purpleThemeConst = const Color(0xff6b4777);

Map<int, Color> purpleTheme = {
  50: Color.fromARGB(255, 233, 206, 242),
  100: Color.fromARGB(255, 191, 149, 205),
  200: Color.fromARGB(255, 154, 110, 169),
  300: Color.fromARGB(255, 166, 117, 182),
  400: Color.fromARGB(255, 153, 109, 168),
  500: Color.fromARGB(255, 139, 97, 154),
  600: Color.fromARGB(255, 138, 92, 153),
  700: Color.fromARGB(255, 138, 91, 153),
  800: Color.fromARGB(255, 137, 93, 151),
  900: Color.fromARGB(255, 165, 101, 186),
};

MaterialColor purpleThemeSwatch = MaterialColor(0xff6b4777, purpleTheme);

const textInputDecoration = InputDecoration(
    fillColor: Color.fromRGBO(186, 104, 200, 1),
    filled: true,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)));

const errorDecoration = BoxDecoration(
    color: Color(0xfff6ddde),
    border: Border(
        top: BorderSide(width: 1.0, color: Colors.red),
        left: BorderSide(width: 1.0, color: Colors.red),
        right: BorderSide(width: 1.0, color: Colors.red),
        bottom: BorderSide(width: 1.0, color: Colors.red)));
