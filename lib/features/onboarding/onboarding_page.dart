// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/capa_onboarding.jpg', // Caminho da sua imagem
            fit: BoxFit.cover,
          ),
          PageView(
            children: [
              _buildPage('Welcome to Saloon Hot', 'Creating the Style of the World', Colors.transparent),
              _buildPage('Easy Scheduling', 'Book your appointments effortlessly', Colors.transparent),
              _buildPage('Stay Connected', 'Get updates and notifications', Colors.transparent),
            ],
          ),
          Positioned(
            bottom: 150,
            left: MediaQuery.of(context).size.width * 0.5 - 150,
            child: Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login'); // Navegação para a tela de login
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: StadiumBorder(),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.black.withOpacity(0.5),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(162, 220, 6, 244),
                        Color.fromARGB(95, 87, 55, 13),
                        Color.fromARGB(139, 182, 6, 246),
                        Color.fromARGB(92, 78, 43, 0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String description, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 186, 194, 195),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
