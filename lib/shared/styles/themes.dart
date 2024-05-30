import 'package:flutter/material.dart';
import 'package:reminder_app/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';


class MyTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: "Montserrat",
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Appcolors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
      scaffoldBackgroundColor: Appcolors.white);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Montserrat",
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Appcolors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Appcolors.white,
        ),
      ),
      scaffoldBackgroundColor: Appcolors.white);
}
