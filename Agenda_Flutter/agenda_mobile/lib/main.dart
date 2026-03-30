import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Caminhos corrigidos conforme sua estrutura de pastas (views/screens/)
import 'package:agenda_mobile/views/screens/login_screen.dart';

void main() async {
  // 1. Inicia os vínculos do Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inicializa o Firebase (Comente se ainda não configurou o google-services.json)
  // await Firebase.initializeApp();

  // 3. Roda o App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Inteligente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF137FEC)),
        useMaterial3: true,
      ),
      // Chama a tela de login que está na pasta views/screens
      home: const LoginScreen(),
    );
  }
}