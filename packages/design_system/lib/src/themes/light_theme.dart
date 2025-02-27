import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

/// Tema claro para la aplicación Cinemak
/// Extiende y personaliza el tema de la aplicación con configuración específica para el modo claro
class LightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black87,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primary.withOpacity(0.1),
      backgroundColor: Colors.white,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: AppColors.primary),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 8,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: AppSpacing.paddingHorizontalMD,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.radiusMD,
        ),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: AppSpacing.paddingHorizontalMD,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.radiusMD,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: AppSpacing.paddingHorizontalMD,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1.copyWith(color: Colors.black87),
      displayMedium: AppTypography.headline2.copyWith(color: Colors.black87),
      displaySmall: AppTypography.headline3.copyWith(color: Colors.black87),
      bodyLarge: AppTypography.body1.copyWith(color: Colors.black87),
      bodyMedium: AppTypography.body2.copyWith(color: Colors.black87),
      titleLarge: AppTypography.subtitle1.copyWith(color: Colors.black87),
      titleMedium: AppTypography.subtitle2.copyWith(color: Colors.black87),
      labelLarge: AppTypography.button.copyWith(color: Colors.black87),
      bodySmall: AppTypography.caption.copyWith(color: Colors.black54),
      labelSmall: AppTypography.overline.copyWith(color: Colors.black54),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: AppSpacing.radiusMD,
        borderSide: BorderSide.none,
      ),
      contentPadding: AppSpacing.paddingMD,
      hintStyle: AppTypography.body2.copyWith(color: Colors.grey),
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFEEEEEE),
      thickness: 1,
      space: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey[200],
      disabledColor: Colors.grey[300],
      selectedColor: AppColors.primary.withOpacity(0.1),
      secondarySelectedColor: AppColors.primary.withOpacity(0.2),
      padding: AppSpacing.paddingXS,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusSM,
      ),
      labelStyle: AppTypography.caption,
      secondaryLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.primary,
      ),
      brightness: Brightness.light,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[900],
      contentTextStyle: AppTypography.body2.copyWith(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusSM,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
