import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono principal
              const Icon(
                Icons.sports_esports,
                size: 120,
                color: Color(0xFFFF4655),
              ),

              const SizedBox(height: 48),

              // Título
              const Text(
                'VALORANT ARSENAL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFECE8E1),
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 24),

              // Subtítulo
              const Text(
                'Equipa los mejores aspectos de armas y destaca en el campo de batalla.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8B9B9E),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Botón de Inicio (ElevatedButton sustituye al antiguo RaisedButton)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4655),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  child: const Text(
                    'Entrar a la Tienda',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}