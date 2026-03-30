import 'package:flutter/material.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  //-----------------------------------------------------------------------------------TELA DE LOGIN ----------------------------------------------------

  // Função para transição suave (Fade)
  void _navegarComSuavidade(BuildContext context, Widget destino) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destino,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF2563EB); // blue-600
    //const Color inputBorder = Color(0xFFE5E7EB); // gray-200

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Entrar', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text('Email', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'seuemail@exemplo.com',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),

              // CORREÇÃO DO ERRO DO PRINT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Removido o 'withValues'
                children: [
                  const Text('Senha', style: TextStyle(fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Esqueceu a senha?', 
                      style: TextStyle(color: brandBlue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 32),

              // Botão Entrar
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Aqui você colocará sua tela Home futuramente
                    _navegarComSuavidade(context, const Scaffold(body: Center(child: Text("Home"))));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brandBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              // Restante do código (Google Button, etc) permanece igual...
            ],
          ),
        ),
      ),
    );
  }
}