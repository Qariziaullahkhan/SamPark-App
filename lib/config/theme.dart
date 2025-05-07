import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampark_app/config/colors.dart';

var lighttheme = ThemeData(brightness: Brightness.light);
var darkthem = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
      primary: lgprimarycolor,
      onPrimary: lgwhitecolor,
      primaryContainer: lgiconcolor,
      secondary: lgbluecolor,
      onPrimaryContainer: lgcontainercolor),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: logtextcolor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: lgwhitecolor,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: lgwhitecolor,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: lgwhitecolor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: lgbluecolor,
    ),
  ),
);
