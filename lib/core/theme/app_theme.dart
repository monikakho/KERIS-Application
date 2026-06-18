import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- COLORS ---
  static const Color primaryBlue = Color(0xFF002366); // Community Blue
  static const Color primaryOrange = Color(0xFFFF8A00); // Explore Page Orange
  
  static const Color background = Color(0xFFF8F9FA);
  static const Color whiteCard = Color(0xFFFFFFFF);
  static const Color headingNavy = primaryBlue;
  static const Color categoryBrown = Color(0xFF994700);
  static const Color bodyGrey = Color(0xFF444650);
  static const Color inactiveTab = Color(0xFFF3F4F5);
  static const Color divider = Color(0xFF994700);
  static const Color borderGrey = Color(0xFFE5E7EB);
  static const Color inactiveText = Color(0xFF9AA0A6);

  static const Color success = Color(0xFF19C88A);
  static const Color warning = Color(0xFFFFAA17);

  // --- TEXT STYLES ---
  static TextStyle pageTitle({double fontSize = 36}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.15,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.8,
      color: headingNavy,
    );
  }

  static TextStyle sectionTitle({double fontSize = 20, Color? color}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.3,
      color: color ?? headingNavy,
    );
  }

  static TextStyle cardTitle({double fontSize = 24, Color? color}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.18,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.45,
      color: color ?? headingNavy,
    );
  }

  static TextStyle body({double fontSize = 14, Color? color}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.55,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: color ?? bodyGrey,
    );
  }

  static TextStyle label({
    double fontSize = 11,
    Color? color,
  }) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.3,
      color: color ?? categoryBrown,
    );
  }

  static TextStyle button({
    double fontSize = 13,
    Color? color,
  }) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      color: color ?? primaryOrange,
    );
  }

  static TextStyle navbar({double fontSize = 11, Color? color}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      height: 1.1,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.1,
      color: color,
    );
  }

  // --- THEME DATA ---
  static ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
      scaffoldBackgroundColor: background,
      useMaterial3: true,
      textTheme: GoogleFonts.manropeTextTheme(), // Apply manrope to entire app by default
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryBlue),
      ),
    );
  }
}
