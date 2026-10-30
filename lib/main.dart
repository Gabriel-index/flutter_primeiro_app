import 'package:flutter/material.dart';
// Importação correta da tela de registro que criámos
import 'package:aplicacao_flutter/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove a faixa de DEBUG
      debugShowCheckedModeBanner: false,
      // Home recebe o nosso widget inicial do aplicativo (a tela de cadastro)
      home: const RegisterScreen(),
    );
  }
}