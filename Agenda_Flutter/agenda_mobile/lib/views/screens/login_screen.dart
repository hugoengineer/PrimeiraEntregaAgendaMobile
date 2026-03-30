import 'package:flutter/material.dart';
// 1. IMPORTANTE: Ajuste o caminho abaixo conforme a sua pasta (views/screens/ ou screens/)
import 'package:agenda_mobile/views/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Função para realizar a transição suave de esmaecimento (Fade)
  void _navegarComSuavidade(BuildContext context, Widget destino) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destino,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF137FEC);
    const Color backgroundLight = Color(0xFFF6F7F8);
    const Color textDark = Color(0xFF212529);
    const Color textSecondary = Color(0xFF6C757D);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.calendar_today_outlined,
                  color: primaryColor,
                  size: 40,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Sua agenda, mais inteligente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textDark,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Organize seus compromissos e tarefas de forma simples e eficaz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ),

              const Spacer(),

              // Botão de Login ATUALIZADO
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // 2. CHAMADA DA HOME SCREEN AQUI:
                    _navegarComSuavidade(context, const HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Fazer Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta? ',
                    style: TextStyle(color: textSecondary, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Aqui você faria o mesmo para a RegisterScreen()
                    },
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}