import 'package:flutter/material.dart';
import 'package:flutterpractice/Pages/home_page.dart';
import 'package:flutterpractice/utils/routes.dart';
import 'package:flutterpractice/widgets/my_theme.dart';

// import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This is a constructor with key passed and checked null as argument...
  // here super is used to call the constructor of the "StatelessWidget"(its parent class)...

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      // removing debug banner...
      debugShowCheckedModeBanner: false,
      // providing initial route...
      initialRoute: MyRoutes.home ,
      // providing route for the app...
      routes: {
        MyRoutes.login : (context)=> const LogInPage(),
        MyRoutes.home: (context)=> const HomePage(),
      },
      // The theme section...
      //themeMode is to change light mode or dark mode...
      themeMode: ThemeMode.light,
      // This is for light mode...
      theme: MyTheme.lightTheme(context),
      //this is for dark mode...
      darkTheme: MyTheme.darkTheme(context),
    ));
  }
}

