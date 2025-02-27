import 'package:flutter/material.dart';
import 'package:home/domain/models/movie.dart';

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
      body: Stack(
        children: [
          // 1. Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6), // Overlay oscuro
            ),
          ),

          // 2. Contenido principal superpuesto
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  movie.releaseDate,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Descripción de la película
                  Text(
                    movie.overview,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.8),
                      height:
                          1.4, // Espacio entre líneas para mejor legibilidad
                    ),
                  ),
                  const Spacer(), // Empuja el botón hacia la parte inferior
                  // Botón "Assitir Trailer"
                  _buildTrailerButton(context),
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
          color: Colors.white,
          iconSize: 30,
          onPressed: () {
            Navigator.of(context).pop(); // Simulación de "Volver"
          },
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          color: Colors.white,
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
            color: const Color(0xFFEC407A), // Color rosado del rating
          ),
        ),
        Text(
          '$percentage%',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTrailerButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // Acción para ver el trailer
        },
        icon: const Icon(Icons.play_arrow, color: Colors.white),
        label: const Text(
          'Ver trailer',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Bordes redondeados
          ),
        ),
      ),
    );
  }
}
