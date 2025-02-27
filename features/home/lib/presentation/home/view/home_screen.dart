import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/domain/models/movie.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar películas al iniciar la pantalla
    //context.read<MoviesCubit>().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A1B9A), // Morado más claro arriba
              Color(0xFF300860), // Morado medio
              Color(0xFF07000D), // Casi negro al final
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sección superior: Título y imagen de perfil
                _buildTopSection(),
                SizedBox(height: 20),

                // Barra de búsqueda
                _buildSearchBar(),
                SizedBox(height: 30), // Espacio adicional antes de Cartelera

                // Listas de películas - Ejemplo con contenido "Películas" por ahora
                Expanded(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        initial: () => Center(child: Text('Iniciando...')),
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        loaded: (upcomingMovies, topRatedMovies) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildMovieListTitle(
                                  'Esta semana',
                                ), // Título de ejemplo
                                SizedBox(height: 10),
                                _buildHorizontalMovieList(topRatedMovies),
                                SizedBox(height: 20),
                                _buildMovieListTitle(
                                  'Más Populares',
                                ), // "Más populares" en español
                                SizedBox(height: 10),
                                _buildHorizontalMovieList(upcomingMovies),
                              ],
                            ),
                          );
                        },
                        error: (message) => Center(
                          child: Text(
                            'Error: $message',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        orElse: () => Center(
                          child: Text(
                            'No hay datos disponibles',
                            style: TextStyle(color: Colors.white),
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.1, // Ajustar altura de línea para coincidir con la imagen
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.5), // Borde blanco
            image: DecorationImage(
              image: NetworkImage(
                  'https://randomuser.me/api/portraits/men/1.jpg'), // Imagen de perfil de ejemplo
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color:
            Color(0xFF6A1B9A), // Fondo Morado Claro para la barra de búsqueda
        borderRadius: BorderRadius.circular(25), // Esquinas redondeadas
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: TextStyle(color: Colors.white70),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          prefixIconConstraints: BoxConstraints(
              minWidth: 50), // Ajustar tamaño del icono de prefijo
          border: InputBorder.none, // Eliminar borde predeterminado
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0), // Ajustar relleno vertical
        ),
      ),
    );
  }

  Widget _buildMovieListTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildHorizontalMovieList(List<Movie> movies) {
    return SizedBox(
      height: 200, // Ajustar altura según sea necesario
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                10), // Esquinas redondeadas para las imágenes de las películas
            child: Image.network(
              imageUrl,
              width: 120, // Ancho de la imagen de la película
              height: 180, // Alto de la imagen de la película
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 120,
                  height: 180,
                  color: Colors.grey[800],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 180,
                  color: Colors.grey[800],
                  child: Icon(Icons.error, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
