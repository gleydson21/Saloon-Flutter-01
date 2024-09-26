// ignore_for_file: use_super_parameters

import 'package:ap02/widget/schedule_button.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário
  String? _email; // Variável para armazenar o e-mail
  String? _password; // Variável para armazenar a senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Faz a imagem cobrir toda a tela
        children: [
          // Imagem de fundo
          Image.asset(
            'images/capa_splash.jpg', // Caminho da sua imagem de fundo
            fit: BoxFit.cover, // Faz a imagem cobrir a tela inteira
          ),
          // Conteúdo por cima da imagem
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _formKey, // Associa a chave ao formulário
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Campo de E-mail
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                        filled: true, // Preenche o fundo do campo
                        fillColor: const Color.fromARGB(255, 223, 159, 232).withOpacity(0.8), // Cor de fundo com opacidade
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu e-mail.';
                        }
                        // Regex para validar o formato do e-mail
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Por favor, insira um e-mail válido.';
                        }
                        return null; // Retorna null se o valor for válido
                      },
                      onSaved: (value) {
                        _email = value; // Salva o e-mail
                      },
                    ),
                    const SizedBox(height: 16.0), // Espaçamento entre os campos
                    
                    // Campo de Senha
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        filled: true, // Preenche o fundo do campo
                        fillColor: const Color.fromARGB(255, 251, 150, 255).withOpacity(0.8), // Cor de fundo com opacidade
                      ),
                      obscureText: true, // Oculta a senha
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha.';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres.';
                        }
                        return null; // Retorna null se o valor for válido
                      },
                      onSaved: (value) {
                        _password = value; // Salva a senha
                      },
                    ),
                    const SizedBox(height: 24.0), // Espaçamento entre o campo e o botão
                    
                    // Botão de Entrar
                    ScheduleButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save(); // Salva os valores

                          // Aqui você pode adicionar sua lógica de autenticação
                          // ignore: avoid_print
                          print('E-mail: $_email, Senha: $_password');
                          
                          Navigator.of(context).pushReplacementNamed('/home'); // Navega para a tela principal após o login
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
