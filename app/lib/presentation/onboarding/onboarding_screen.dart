import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/dune_background.png', // Asegúrate de tener la imagen en assets y configurada en pubspec.yaml
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
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(
                      1), // Ajusta la opacidad para que coincida con la imagen
                ],
              ),
            ),
          ),
          // Content on top of the image and gradient
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .end, // Alinea el contenido al final de la pantalla
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinea el texto a la izquierda
                children: [
                  // THE MOVIE DB
                  Row(
                    children: [
                      Text(
                        'CINEMAK ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              16.0, // Ajusta el tamaño de fuente si es necesario
                        ),
                      ),
                      Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        ' DB', // Parte extra para que coincida exactamente con la imagen
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              16.0, // Ajusta el tamaño de fuente si es necesario
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          16.0), // Espacio entre el título y el texto principal
                  // Texto principal
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        height: 1.1,
                      ),
                      children: [
                        TextSpan(text: 'Todo sobre '),
                        TextSpan(
                          text: 'películas',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ',\n'),
                        TextSpan(
                          text: 'series',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'animes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' y\n'),
                        TextSpan(
                          text: 'mucho más',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          8.0), // Espacio entre el texto principal y el secundario
                  // Texto secundario
                  Text(
                    'Manténgase al tanto de las informaciones sobre películas, series, animes y mucho más.',
                    style: TextStyle(
                      color: Colors
                          .white70, // Color blanco ligeramente transparente
                      fontSize: 14.0, // Tamaño de fuente más pequeño
                    ),
                  ),
                  SizedBox(height: 24.0), // Espacio antes del botón
                  // Botón "Acessar"
                  SizedBox(
                    width: double.infinity, // Ancho completo del botón
                    child: ElevatedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFF9333EA), // Color morado del botón (puedes ajustarlo con un selector de color)
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Bordes redondeados
                        ),
                      ),
                      child: Text('Continuar',
                          style: TextStyle(color: Colors.white)),
                    ),
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
