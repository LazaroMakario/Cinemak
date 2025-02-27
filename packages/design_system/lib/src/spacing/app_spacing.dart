import 'package:flutter/material.dart';

/// Define los espaciados estándar para la aplicación Cinemak
class AppSpacing {
  // Valores principales de espaciado
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
  
  // Padding estándar para contenedores
  static const EdgeInsets paddingXXS = EdgeInsets.all(xxs);
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  
  // Padding horizontal y vertical
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(vertical: md);
  
  // Márgenes comunes
  static const EdgeInsets marginXS = EdgeInsets.all(xs);
  static const EdgeInsets marginSM = EdgeInsets.all(sm);
  static const EdgeInsets marginMD = EdgeInsets.all(md);
  static const EdgeInsets marginLG = EdgeInsets.all(lg);
  
  // Espaciadores para listas y columnas
  static const SizedBox verticalSpacerXXS = SizedBox(height: xxs);
  static const SizedBox verticalSpacerXS = SizedBox(height: xs);
  static const SizedBox verticalSpacerSM = SizedBox(height: sm);
  static const SizedBox verticalSpacerMD = SizedBox(height: md);
  static const SizedBox verticalSpacerLG = SizedBox(height: lg);
  static const SizedBox verticalSpacerXL = SizedBox(height: xl);
  
  // Espaciadores horizontales
  static const SizedBox horizontalSpacerXXS = SizedBox(width: xxs);
  static const SizedBox horizontalSpacerXS = SizedBox(width: xs);
  static const SizedBox horizontalSpacerSM = SizedBox(width: sm);
  static const SizedBox horizontalSpacerMD = SizedBox(width: md);
  static const SizedBox horizontalSpacerLG = SizedBox(width: lg);
  static const SizedBox horizontalSpacerXL = SizedBox(width: xl);
  
  // Bordes redondeados
  static final BorderRadius radiusXS = BorderRadius.circular(xs / 2);
  static final BorderRadius radiusSM = BorderRadius.circular(xs);
  static final BorderRadius radiusMD = BorderRadius.circular(sm);
  static final BorderRadius radiusLG = BorderRadius.circular(md);
  static final BorderRadius radiusXL = BorderRadius.circular(lg);
}
