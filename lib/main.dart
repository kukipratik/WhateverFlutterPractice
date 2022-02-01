import 'package:flutter/material.dart';
import 'package:flutterpractice/Pages/home_page.dart';
import 'package:flutterpractice/routes.dart';
import 'package:google_fonts/google_fonts.dart';


// import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      // providing route for the app...
      routes: {
        "/" : (context)=> const LogInPage(),
        MyRoutes.home: (context)=> const HomePage(),
      },
      // providing theme to the app...
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.purple,
      ),
    ));
  }
}

