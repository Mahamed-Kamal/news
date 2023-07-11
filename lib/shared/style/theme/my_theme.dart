
import 'package:flutter/material.dart';

class MyTheme{
  static Color lightPrimaryColor =  Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:AppBarTheme(
      backgroundColor: lightPrimaryColor,
      centerTitle: true,
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),


    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4F5A69)
      ),
      bodySmall: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
          fontSize: 14,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF79828B),
        fontSize: 10,
          ),
          titleLarge: TextStyle(fontSize: 13, color: Color(0xFFA3A3A3)),
          headlineMedium: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            color: Color(0xFF42505C),
          )));
}