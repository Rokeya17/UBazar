import 'package:flutter/material.dart';
import 'package:ubazar/presentation/UI/Screens/splash_screen.dart';
import 'package:ubazar/styles/theme.dart';

class UBazar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
