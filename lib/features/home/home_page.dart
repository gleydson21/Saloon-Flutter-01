import 'package:ap02/app_routes.dart';
import 'package:ap02/features/services/service_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Lista de serviços e suas imagens
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Corte de cabelo feminino',
      'image': 'images/servicos/corte_cabelo.jpg',
      'description': 'Corte moderno e personalizado para você.',
      'price': 80.00,
    },
    {
      'name': 'Escova e finalização',
      'image': 'assets/images/services/escova.jpg',
      'description': 'Deixe seus cabelos com um acabamento perfeito.',
      'price': 60.00,
    },
    {
      'name': 'Barba e cabelo masculino',
      'image': 'assets/images/services/corte_masculino.jpg',
      'description': 'Corte masculino completo com barba.',
      'price': 70.00,
    },
    {
      'name': 'Coloração de cabelo',
      'image': 'assets/images/services/coloracao.jpg',
      'description': 'Tingimento profissional com opções de cores modernas.',
      'price': 120.00,
    },
    {
      'name': 'Hidratação capilar',
      'image': 'assets/images/services/hidratacao.jpg',
      'description': 'Tratamento profundo para cabelos saudáveis e brilhosos.',
      'price': 90.00,
    },
    {
      'name': 'Manicure e pedicure',
      'image': 'assets/images/services/manicure.jpg',
      'description': 'Serviço completo de manicure e pedicure.',
      'price': 50.00,
    },
    {
      'name': 'Maquiagem profissional',
      'image': 'assets/images/services/maquiagem.jpg',
      'description': 'Maquiagem para eventos especiais.',
      'price': 150.00,
    },
    {
      'name': 'Depilação',
      'image': 'assets/images/services/depilacao.jpg',
      'description': 'Depilação a cera com técnica avançada.',
      'price': 100.00,
    },
  ];

  // Estilo de texto
  TextStyle get titleStyle => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        backgroundColor: Colors.black54,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        backgroundColor: const Color.fromARGB(255, 0, 9, 9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem no topo
            Stack(
              children: [
                Image.asset(
                  'assets/images/capa_onboarding.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 260,
                ),
                // Texto sobre a imagem
                Positioned(
                  bottom: 15,
                  left: 20,
                  child: Text(
                    'Serviços',
                    style: titleStyle,
                  ),
                ),
              ],
            ),
            // Divisão
            const Divider(
              thickness: 2,
              color: Color.fromARGB(255, 0, 0, 0),
              height: 40,
              indent: 16,
              endIndent: 16,
            ),
            // Fotos dos serviços
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    serviceName: services[index]['name']!,
                    serviceImage: services[index]['image']!,
                    serviceDescription: services[index]['description']!,
                    servicePrice: services[index]['price']!,
                    onTap: () {
                      // Navegação para a tela de detalhes do serviço
                      Navigator.pushNamed(
                        context,
                        AppRoutes.serviceDetail, // Rota definida anteriormente
                        arguments: services[index], // Passa o serviço como argumento
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
