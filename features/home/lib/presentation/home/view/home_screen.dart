import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/di/injector.dart';
import 'package:home/domain/models/movie.dart';
import 'package:design_system/design_system.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // El cubit ahora se proporciona a través de BlocProvider en el HomeModuleWrapper

  final HomeCubit _homeCubit = getHomeIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.primaryGradient,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sección superior: Título y imagen de perfil
                _buildTopSection(),
                SizedBox(height: AppSpacing.md),

                // Barra de búsqueda
                _buildSearchBar(),
                SizedBox(height: AppSpacing.lg),

                // Listas de películas
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        initial: () => Center(
                          child: Text(
                            'Iniciando...',
                            style: AppTypography.body1.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        loaded: (upcomingMovies, topRatedMovies) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildMovieListTitle('Esta semana'),
                                SizedBox(height: AppSpacing.xs),
                                _buildHorizontalMovieList(topRatedMovies),
                                SizedBox(height: AppSpacing.md),
                                _buildMovieListTitle('Más Populares'),
                                SizedBox(height: AppSpacing.xs),
                                _buildHorizontalMovieList(upcomingMovies),
                              ],
                            ),
                          );
                        },
                        error: (message) => Center(
                          child: Text(
                            'Error: $message',
                            style: AppTypography.body1.copyWith(
                              color: AppColors.error,
                            ),
                          ),
                        ),
                        orElse: () => Center(
                          child: Text(
                            'No hay datos disponibles',
                            style: AppTypography.body1.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '¿Qué quieres\nver hoy?',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
            height: 1.1,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.textPrimary,
              width: 1.5,
            ),
            image: const DecorationImage(
              image:
                  NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return SearchBarInput(
      hintText: 'Buscar',
      onChanged: (value) {
        // Implementar búsqueda
      },
      onSubmitted: (value) {
        // Realizar búsqueda
      },
    );
  }

  Widget _buildMovieListTitle(String title) {
    return Text(
      title,
      style: AppTypography.subtitle1.copyWith(
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildHorizontalMovieList(List<Movie> movies) {
    return SizedBox(
      height: 210, // Ajustado a 210px para las nuevas tarjetas
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: EdgeInsets.only(right: AppSpacing.xs),
            child: _buildMoviePosterCard(movie),
          );
        },
      ),
    );
  }

  Widget _buildMoviePosterCard(Movie movie) {
    // URL base para imágenes de poster de TMDB
    final String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
    final String imageUrl = movie.posterPath != null
        ? '$baseImageUrl${movie.posterPath}'
        : 'https://via.placeholder.com/120x180?text=No+Image';

    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('./details', arguments: movie);
      },
      child: MovieCard(
        posterUrl: imageUrl,
        title: movie.title,
        year:
            movie.releaseDate != null ? movie.releaseDate.substring(0, 4) : '',
        rating: movie.voteAverage.toDouble(),
      ),
    );
  }
}
