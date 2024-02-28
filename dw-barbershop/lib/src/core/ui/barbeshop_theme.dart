import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbeshopTheme {
  static const _defaultInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)));
  static ThemeData themeData = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: ColorsConstants.grey),
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: ColorsConstants.red),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConstants.brow,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      fontFamily: FontsConstants.fontFamily);
}
