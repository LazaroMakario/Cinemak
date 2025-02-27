import 'package:flutter/material.dart';
import '../../colors/app_colors.dart';
import '../../spacing/app_spacing.dart';
import '../../typography/app_typography.dart';

/// Tarjeta utilizada para mostrar información de películas en formato grid o lista
class MovieCard extends StatelessWidget {
  final String title;
  final String? posterUrl;
  final String? year;
  final double? rating;
  final VoidCallback? onTap;

  const MovieCard({
    Key? key,
    required this.title,
    this.posterUrl,
    this.year,
    this.rating,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 200, // Altura fija para toda la tarjeta
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: AppSpacing.radiusMD,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Poster como fondo
            Positioned.fill(
              child: _buildPosterImage(),
            ),

            // Overlay de gradiente en la parte inferior
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 100, // Aumentar la altura del gradiente
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(100), // Transición suave
                      Colors.black.withAlpha(220), // Casi opaco al final
                    ],
                    stops: const [0.0, 0.4, 1.0], // Distribución del gradiente
                  ),
                ),
              ),
            ),

            // Rating badge
            if (rating != null)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: AppSpacing.paddingXXS,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppSpacing.radiusXS,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      AppSpacing.horizontalSpacerXXS,
                      Text(
                        rating!.toStringAsFixed(1),
                        style: AppTypography.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosterImage() {
    if (posterUrl == null) {
      return Container(
        color: AppColors.backgroundLight,
        child: const Center(
          child: Icon(
            Icons.movie,
            color: AppColors.textSecondary,
            size: 40,
          ),
        ),
      );
    }

    return Image.network(
      posterUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.backgroundLight,
          child: const Center(
            child: Icon(
              Icons.error,
              color: AppColors.textSecondary,
              size: 40,
            ),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: AppColors.backgroundLight,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
      },
    );
  }
}
