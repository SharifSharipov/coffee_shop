import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightAppFonts {
  static const String inter = 'Inter';
  static TextStyle titleMedium = const TextStyle(
    color: Colors.black,
    fontFamily: inter,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}

class DarkAppFonts {
  static const String inter = 'Inter';
  static const String besley = 'Besley';

  static TextStyle titleLarge = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );
  static TextStyle titleMedium = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static TextStyle titleSmall = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static TextStyle headlineSmall = GoogleFonts.besley(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );
  static TextStyle bodyMedium = GoogleFonts.rosarivo(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static TextStyle bodySmall = GoogleFonts.rosarivo(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  static TextStyle bodyLarge = GoogleFonts.openSans(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}
