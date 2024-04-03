import 'package:finance/private/navigation/transaction/fade_page.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'sizes.dart';

class FinanceTheme {
  static final _seedColor = AppColors.seedColor.color;
  static final _colorScheme = ColorScheme.fromSeed(seedColor: _seedColor);

  static ThemeData get data => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _seedColor,
    listTileTheme: ListTileThemeData(
      tileColor: _colorScheme.primaryContainer,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeTransationBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.defaultInputDecorationRadius.radius),
      ),
      fillColor: _colorScheme.onInverseSurface,
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSizes.defaultInputDecorationContentPadding.vertical,
        horizontal: AppSizes.defaultInputDecorationContentPadding.horizontal,
      )
    ),
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(0),
      backgroundColor: _colorScheme.primaryContainer,
    ),
    iconTheme: IconThemeData(
      size: AppSizes.defaultIconSize.all,
    )
  );
}