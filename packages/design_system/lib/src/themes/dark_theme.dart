import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

/// Tema oscuro para la aplicación Cinemak
/// Extiende y personaliza el tema de la aplicación con configuración específica para el modo oscuro
class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
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
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primary.withOpacity(0.2),
      backgroundColor: AppColors.backgroundLight,
      iconTheme: MaterialStateProperty.all(
        const IconThemeData(color: Colors.white),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight,
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
      filled: true,
      fillColor: AppColors.backgroundCard,
      border: OutlineInputBorder(
        borderRadius: AppSpacing.radiusMD,
        borderSide: BorderSide.none,
      ),
      contentPadding: AppSpacing.paddingMD,
      hintStyle: AppTypography.body2.copyWith(color: AppColors.textSecondary),
      prefixIconColor: AppColors.textSecondary,
      suffixIconColor: AppColors.textSecondary,
    ),
    cardTheme: CardTheme(
      color: AppColors.backgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shadowColor: Colors.transparent,
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF2A2A2A),
      thickness: 1,
      space: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.backgroundLight,
      disabledColor: AppColors.backgroundLight.withOpacity(0.5),
      selectedColor: AppColors.primary.withOpacity(0.3),
      secondarySelectedColor: AppColors.primary.withOpacity(0.4),
      padding: AppSpacing.paddingXS,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusSM,
      ),
      labelStyle: AppTypography.caption.copyWith(color: Colors.white),
      secondaryLabelStyle: AppTypography.caption.copyWith(
        color: AppColors.primary,
      ),
      brightness: Brightness.dark,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[800],
      contentTextStyle: AppTypography.body2.copyWith(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusSM,
      ),
      behavior: SnackBarBehavior.floating,
    ),
    // Diálogos
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.backgroundCard,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.radiusMD,
      ),
      titleTextStyle: AppTypography.headline3.copyWith(color: Colors.white),
      contentTextStyle: AppTypography.body1.copyWith(color: Colors.white),
    ),
  );
}
