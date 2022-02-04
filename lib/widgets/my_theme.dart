import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // method for the light theme...
  static lightTheme(context) {
    return ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 15,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  // method for the dark theme...
  static darkTheme(context) => ThemeData(brightness: Brightness.dark);
}
