import 'package:flutter/material.dart';
import 'package:property_investment_app/chart_prop.dart';
import 'package:property_investment_app/forget_pass.dart';
import 'package:property_investment_app/forget_pass2.dart';
import 'package:property_investment_app/forget_pass3.dart';
import 'package:property_investment_app/home_screen_1.dart';
import 'package:property_investment_app/onBoard.dart';
import 'package:property_investment_app/onBoard_three.dart';
import 'package:property_investment_app/portfolio.dart';
import 'package:property_investment_app/settings.dart';
import 'package:property_investment_app/splash_screen.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Property Investment App',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashScreen(),

      );
  }
}