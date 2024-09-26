import 'package:ap02/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.splash, // Mantenha a rota inicial como splash
    onGenerateRoute: AppRoutes.generateRoute,
  ));
}
