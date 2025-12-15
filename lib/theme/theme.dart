import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData light = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Color(0xffffffff),
    hintStyle: TextStyle(fontSize: 15.sp, color: Color(0xff888888)),
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(fontSize: 29.sp, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Color(0xffbebebd),
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Color(0xffffffff),
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
    titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Color(0xff21bf73),
      foregroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8.sp),
      ),
      fixedSize: Size(double.maxFinite, 38.h),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(70.w, double.maxFinite),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xff21bf73),
    foregroundColor: Color(0xffffffff),
  ),
);
