import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // method for the light theme...
  static lightTheme(context) {
    return ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.poppins().fontFamily,
        // canvasColor: Colors.red,
        primaryColor: Colors.green,
        splashColor: Colors.black,
        hintColor: Colors.black,
        backgroundColor: Vx.hexToColor("#f0f0f0"),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 15,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  // method for the dark theme...
  static darkTheme(context) {
    return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        splashColor: Colors.white,
        primaryColor: const Color.fromARGB(147, 1, 255, 200),
        fontFamily: GoogleFonts.poppins().fontFamily,
        // canvasColor: Colors.blueGrey,
        hintColor: Colors.white,
        backgroundColor: Vx.hexToColor("#484a45"),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 15,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }
}
