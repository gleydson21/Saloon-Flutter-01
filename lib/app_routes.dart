import 'package:ap02/features/auth/login/login_page.dart';
import 'package:ap02/features/home/home_page.dart';
import 'package:ap02/features/onboarding/onboarding_page.dart';
import 'package:ap02/features/services/service_detail.dart'; // Importando a tela de detalhes
import 'package:ap02/features/splash/splash_page.dart';
import 'package:flutter/material.dart';


// Define as rotas do aplicativo
class AppRoutes {
  static const String splash = '/splash'; // Rota da SplashScreen
  static const String onboarding = '/onboarding'; // Rota da tela de onboarding
  static const String login = '/login'; // Rota da tela de login
  static const String signup = '/signup'; // Rota da tela de cadastro
  static const String home = '/home'; // Rota da tela principal (home)
  static const String serviceDetail = '/serviceDetail'; // Nova rota para detalhes do serviço

  // Gerador de rotas para navegação
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        // Adicione a tela de cadastro quando estiver pronta
        // return MaterialPageRoute(builder: (_) => SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case serviceDetail:
        // Recupera os argumentos a partir das configurações
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ServiceDetailPage(
            serviceName: args['name'],
            serviceDescription: args['description'],
            servicePrice: args['price'],
          ),
        );
      default:
        return _errorRoute(); // Rota de erro
    }
  }

  // Rota de erro personalizada
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Página não encontrada')),
        body: const Center(
          child: Text('Erro: A página não foi encontrada!'),
        ),
      ),
    );
  }
}
