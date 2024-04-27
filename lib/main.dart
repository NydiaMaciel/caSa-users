import 'package:casa/screens/generals/login.dart';
import 'package:casa/screens/generals/colores.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appBarcolor,
        dialogBackgroundColor: color25,
        focusColor: color6,
        buttonTheme: ButtonThemeData(
          buttonColor: color6,
          splashColor: appBarcolor4,
          focusColor: color6,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: iconColorForm),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              style: BorderStyle.solid,
              color: appBarcolor4
            ),
          ),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: fucsia,
          circularTrackColor: color6,
          linearMinHeight: 20.0,
        ),
      ),
      home: Login(),
    );
  }
}