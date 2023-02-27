import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'TitilliumWeb',
  primaryColor: Color(0xffcc9900),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: Color(0xFF9E9E9E),
  disabledColor:  Color(0xFF343A40),
  canvasColor: Color(0xFFFCFCFC),
  errorColor: Color(0xFFFF5A5A),
  colorScheme: const ColorScheme.light(
    primary: Color(0xffcc9900),
    secondary: Color(0xfff3b602),
    tertiary: Color(0xFFF9D4A8),
    tertiaryContainer: Color(0xFFADC9F3),
    onTertiaryContainer: Color(0xFF33AF74),
    primaryContainer: Color(0xFF9AECC6),
    secondaryContainer: Color(0xFFF2F2F2),
    surface: Color(0xFF00FF58),
    surfaceTint: Color(0xff7c5d00),
    onPrimary: Color(0xffcc9900),
    onSecondary: Color(0xffcc9900),
  ),

  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);