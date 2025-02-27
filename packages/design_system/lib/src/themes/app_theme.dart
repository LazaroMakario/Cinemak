import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

/// Clase base para la definición de temas de la aplicación Cinemak
class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      background: Colors.white,
      onBackground: AppColors.backgroundDark,
      surface: Colors.white,
      onSurface: AppColors.backgroundDark,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: AppSpacing.paddingHorizontalMD,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.radiusMD,
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1.copyWith(color: AppColors.backgroundDark),
      displayMedium: AppTypography.headline2.copyWith(color: AppColors.backgroundDark),
      displaySmall: AppTypography.headline3.copyWith(color: AppColors.backgroundDark),
      bodyLarge: AppTypography.body1.copyWith(color: AppColors.backgroundDark),
      bodyMedium: AppTypography.body2.copyWith(color: AppColors.backgroundDark),
      titleLarge: AppTypography.subtitle1.copyWith(color: AppColors.backgroundDark),
      titleMedium: AppTypography.subtitle2.copyWith(color: AppColors.backgroundDark),
      labelLarge: AppTypography.button.copyWith(color: AppColors.backgroundDark),
      bodySmall: AppTypography.caption.copyWith(color: AppColors.backgroundDark),
      labelSmall: AppTypography.overline.copyWith(color: AppColors.backgroundDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      contentPadding: AppSpacing.paddingMD,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      background: AppColors.background,
      onBackground: Colors.white,
      surface: AppColors.backgroundCard,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: AppSpacing.paddingHorizontalMD,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.radiusMD,
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1.copyWith(color: Colors.white),
      displayMedium: AppTypography.headline2.copyWith(color: Colors.white),
      displaySmall: AppTypography.headline3.copyWith(color: Colors.white),
      bodyLarge: AppTypography.body1.copyWith(color: Colors.white),
      bodyMedium: AppTypography.body2.copyWith(color: Colors.white),
      titleLarge: AppTypography.subtitle1.copyWith(color: Colors.white),
      titleMedium: AppTypography.subtitle2.copyWith(color: Colors.white),
      labelLarge: AppTypography.button.copyWith(color: Colors.white),
      bodySmall: AppTypography.caption.copyWith(color: AppColors.textSecondary),
      labelSmall: AppTypography.overline.copyWith(color: AppColors.textSecondary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      contentPadding: AppSpacing.paddingMD,
      fillColor: AppColors.backgroundCard,
      filled: true,
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
    ),
  );
}
