import 'package:flutter/material.dart';
import 'package:home/domain/models/movie.dart';
import 'package:design_system/design_system.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // URL base para imágenes de poster de TMDB
    final String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
    final String imageUrl = movie.posterPath != null
        ? '$baseImageUrl${movie.posterPath}'
        : 'https://via.placeholder.com/120x180?text=No+Image';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // 1. Imagen de fondo
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 2. Gradiente superpuesto
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background.withValues(alpha: 0.5),
                    AppColors.background.withValues(alpha: 1),
                    AppColors.background.withValues(alpha: 1),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // 3. Contenido principal superpuesto
          SafeArea(
            child: Padding(
              padding: AppSpacing.paddingLG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Barra superior: Botón "Volver" y botón de "Favorito"
                  _buildAppBar(context),

                  SizedBox(height: MediaQuery.of(context).size.height / 4),

                  // Información de la película (Rating, año, duración)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRatingCircle(45), // Círculo de rating (ejemplo 45%)
                      AppSpacing.horizontalSpacerMD,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: AppTypography.headline3.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                            AppSpacing.verticalSpacerXS,
                            Row(
                              children: [
                                Text(
                                  movie.releaseDate,
                                  style: AppTypography.body2.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.verticalSpacerXL,

                  // Descripción de la película
                  Text(
                    movie.overview,
                    style: AppTypography.body1.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  const Spacer(), // Empuja el botón hacia la parte inferior

                  // Botón "Ver Trailer"
                  PrimaryButton(
                    text: 'Ver trailer',
                    isFullWidth: true,
                    icon: Icons.play_arrow,
                    onPressed: () {
                      // Acción para ver el trailer
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

  // --- Widgets de construcción ---

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textPrimary,
          iconSize: 30,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          color: AppColors.textPrimary,
          iconSize: 30,
          onPressed: () {
            // Acción para añadir a favoritos
          },
        ),
      ],
    );
  }

  Widget _buildRatingCircle(int percentage) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70, // Tamaño del círculo
          height: 70,
          child: CircularProgressIndicator(
            value: percentage / 100, // Valor del progreso (0.0 - 1.0)
            strokeWidth: 6,
            backgroundColor: Colors.grey.shade800,
            color: AppColors.secondary, // Color principal para rating
          ),
        ),
        Text(
          '$percentage%',
          style: AppTypography.subtitle1.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
