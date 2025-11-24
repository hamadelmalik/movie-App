import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_palette.dart';

class AppTheme {
  static _border({Color color = AppPalette.borderColor}) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(17),
      enabledBorder: _border(),
      focusedBorder: _border(color:AppPalette.gradient2),
    ),
  );
}
