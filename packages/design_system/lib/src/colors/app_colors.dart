import 'package:flutter/material.dart';

/// Define los colores principales de la aplicación Cinemak
class AppColors {
  // Colores primarios
  static const Color primary = Color(0xFF1E3264); // Azul oscuro principal
  static const Color primaryLight = Color(0xFF4057AB);
  static const Color primaryDark = Color(0xFF0A1A3F);
  
  // Colores secundarios
  static const Color secondary = Color(0xFFE21221); // Rojo cinematográfico
  static const Color secondaryLight = Color(0xFFFF5252);
  static const Color secondaryDark = Color(0xFFAA0114);
  
  // Colores de fondo
  static const Color background = Color(0xFF121212); // Fondo oscuro tipo cine
  static const Color backgroundLight = Color(0xFF1E1E1E);
  static const Color backgroundDark = Color(0xFF000000);
  static const Color backgroundCard = Color(0xFF2C2C2C);
  
  // Colores de texto
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB8B8B8);
  static const Color textDisabled = Color(0xFF757575);
  
  // Colores de acción
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFB74D);
  static const Color info = Color(0xFF2196F3);
  
  // Colores de gradientes
  static const List<Color> primaryGradient = [
    Color(0xFF1E3264),
    Color(0xFF4057AB),
  ];
  
  static const List<Color> posterGradient = [
    Color(0x00121212),
    Color(0xCC121212),
    Color(0xFF121212),
  ];
}
