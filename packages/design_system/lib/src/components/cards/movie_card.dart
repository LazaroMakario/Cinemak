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
        width: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: AppSpacing.radiusMD,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: posterUrl != null
                      ? Image.network(
                          posterUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.backgroundLight,
                              child: const Center(
                                child: Icon(
                                  Icons.movie,
                                  color: AppColors.textSecondary,
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
                        )
                      : Container(
                          color: AppColors.backgroundLight,
                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              color: AppColors.textSecondary,
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
            // Movie info
            Padding(
              padding: AppSpacing.paddingXS,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.subtitle2,
                  ),
                  if (year != null) ...[
                    AppSpacing.verticalSpacerXXS,
                    Text(
                      year!,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
