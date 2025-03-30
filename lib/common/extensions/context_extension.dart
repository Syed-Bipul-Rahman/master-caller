/*
* Author  : Syed Bipul Rahman
* Created : March 27, 2025
* Github  : Syed-bipul-rahman
*
* */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomTextStyles on BuildContext {
  // ----- Display Styles -----
  TextStyle get displayLarge => GoogleFonts.outfit(
    fontSize: 57.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(this).textTheme.displayLarge?.color,
  );

  TextStyle get displayMedium => GoogleFonts.outfit(
    fontSize: 45.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(this).textTheme.displayMedium?.color,
  );

  TextStyle get displaySmall => GoogleFonts.outfit(
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    color: Theme.of(this).textTheme.displaySmall?.color,
  );

  // ----- Headline Styles -----
  TextStyle get headlineLarge => GoogleFonts.outfit(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: Theme.of(this).textTheme.headlineLarge?.color,
  );

  TextStyle get headlineMedium => GoogleFonts.outfit(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: Theme.of(this).textTheme.headlineMedium?.color,
  );

  TextStyle get headlineSmall => GoogleFonts.outfit(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: Theme.of(this).textTheme.headlineSmall?.color,
  );

  // ----- Title Styles -----
  TextStyle get titleLarge => GoogleFonts.outfit(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: Theme.of(this).textTheme.titleLarge?.color,
  );

  TextStyle get titleMedium => GoogleFonts.outfit(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Theme.of(this).textTheme.titleMedium?.color,
  );

  TextStyle get titleSmall => GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: Theme.of(this).textTheme.titleSmall?.color,
  );

  // ----- Body Styles -----
  TextStyle get bodyLarge => GoogleFonts.outfit(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Color(0xFF4E4E4E),
  );

  TextStyle get bodyLargeBold => GoogleFonts.outfit(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Color(0xFF111111),
  );

  TextStyle get bodyMedium => GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: Color(0xFF4E4E4E),
  );

  TextStyle get bodySmall => GoogleFonts.outfit(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: Color(0xFF999999),
  );
  TextStyle get bodySmallBold => GoogleFonts.outfit(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: Color(0xFF999999),
  );
TextStyle get bodySmallWithoutColor => GoogleFonts.outfit(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  color: Theme.of(this).textTheme.labelMedium?.color,
  );

  // ----- Label Styles -----
  TextStyle get labelLarge => GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: Theme.of(this).textTheme.labelLarge?.color,
  );

  TextStyle get labelMedium => GoogleFonts.outfit(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: Theme.of(this).textTheme.labelMedium?.color,
  );

  TextStyle get labelSmall => GoogleFonts.outfit(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Theme.of(this).textTheme.labelSmall?.color,
  );

  // ----- Custom Weight Variants -----
  TextStyle w100(double fontSize) => GoogleFonts.outfit(
    fontWeight: FontWeight.w100,
    fontSize: fontSize.sp,
    color: Theme.of(this).textTheme.bodyMedium?.color,
  );

  TextStyle w200(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w200, fontSize: fontSize.sp);

  TextStyle w300(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w300, fontSize: fontSize.sp);

  TextStyle w400(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w400, fontSize: fontSize.sp);

  TextStyle w500(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w500, fontSize: fontSize.sp);

  TextStyle w600(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: fontSize.sp);

  TextStyle w700(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: fontSize.sp);

  TextStyle w800(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w800, fontSize: fontSize.sp);

  TextStyle w900(double fontSize) =>
      GoogleFonts.outfit(fontWeight: FontWeight.w900, fontSize: fontSize.sp);

  // ----- Helper Methods -----
  TextStyle withColor(Color color) =>
      GoogleFonts.outfit().copyWith(color: color);

  TextStyle responsiveSize(double sm, double md, double lg) =>
      GoogleFonts.outfit(fontSize: _responsiveSize(sm, md, lg).sp);

  double _responsiveSize(double sm, double md, double lg) {
    final width = MediaQuery.of(this).size.width;
    return width < 600 ? sm : (width < 1200 ? md : lg);
  }
}
