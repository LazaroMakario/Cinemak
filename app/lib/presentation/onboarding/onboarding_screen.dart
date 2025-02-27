import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:design_system/design_system.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/dune_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.posterGradient,
              ),
            ),
          ),
          // Content on top of the image and gradient
          SafeArea(
            child: Padding(
              padding: AppSpacing.paddingLG,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Logo Title
                  Row(
                    children: [
                      Text(
                        'CINEMAK ',
                        style: AppTypography.subtitle1.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: const BoxDecoration(
                          color: AppColors.textPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        ' DB',
                        style: AppTypography.subtitle1.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.verticalSpacerMD,
                  // Texto principal
                  RichText(
                    text: TextSpan(
                      style: AppTypography.headline1.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.1,
                      ),
                      children: [
                        TextSpan(
                          text: 'Todo sobre ',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'películas',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: 'series',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(text: ', '),
                        TextSpan(
                          text: 'animes',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: ' y\n',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'mucho más',
                          style: AppTypography.headline1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                  AppSpacing.verticalSpacerXS,
                  // Texto secundario
                  Text(
                    'Manténgase al tanto de las informaciones sobre películas, series, animes y mucho más.',
                    style: AppTypography.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  AppSpacing.verticalSpacerXL,
                  // Botón "Continuar"
                  PrimaryButton(
                    text: 'Continuar',
                    isFullWidth: true,
                    onPressed: () {
                      Modular.to.pushNamed('/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
