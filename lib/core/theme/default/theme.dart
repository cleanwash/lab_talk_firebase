import 'package:flutter/material.dart';
import 'package:lab_talk_firebase/core/theme/typography.dart';
import 'material_theme.dart';

final TextTheme textTheme = TextTheme(
  displayLarge: displayLarge,
  displayMedium: displayMedium,
  displaySmall: displaySmall,
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall,
  titleLarge: titleLarge,
  titleMedium: titleMedium,
  titleSmall: titleSmall,
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium,
  bodySmall: bodySmall,
  labelLarge: labelLarge,
  labelMedium: labelMedium,
  labelSmall: labelSmall,
);
final materialTheme = MaterialTheme(textTheme);

final ThemeData lightTheme = materialTheme.light();

final ThemeData darkTheme = materialTheme.dark();

final ThemeData lightHighContrastTheme = materialTheme.lightHighContrast();

final ThemeData darkHighContrastTheme = materialTheme.darkHighContrast();
