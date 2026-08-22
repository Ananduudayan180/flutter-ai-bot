import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTextTheme = GoogleFonts.interTextTheme()
    .apply(bodyColor: Colors.white, displayColor: Colors.white)
    .copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );

final lightTextTheme = GoogleFonts.interTextTheme()
    .apply(bodyColor: Colors.black, displayColor: Colors.black)
    .copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
