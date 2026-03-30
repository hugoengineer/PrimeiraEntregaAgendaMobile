import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importante para o MVVM
// import '../viewmodels/create_user_viewmodel.dart'; // Importe sua viewmodel aqui

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 1. CRIAÇÃO DOS CONTROLADORES (Os "clipes" que seguram o texto)
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Boa prática de QA: Limpar os controladores da memória ao fechar a tela
  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

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
    const Color primaryColor = Color(0xFF137FEC);
    const Color backgroundLight = Color(0xFFFFFFFF);
    const Color borderColor = Color(0xFFE2E8F0);

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Criar conta',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // 2. PASSANDO OS CONTROLADORES PARA AS FUNÇÕES
            _buildInputField('Nome', 'Digite seu nome completo', _nomeController),
            const SizedBox(height: 16),
            _buildInputField('Email', 'exemplo@email.com', _emailController, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            _buildPasswordField('Senha', _obscurePassword, _senhaController, () {
              setState(() => _obscurePassword = !_obscurePassword);
            }),
            const SizedBox(height: 16),
            _buildPasswordField('Confirmar Senha', _obscureConfirmPassword, _confirmarSenhaController, () {
              setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
            }),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // 3. ENVIANDO OS DADOS PARA A VIEWMODEL
                  // final viewModel = Provider.of<CreateUserViewModel>(context, listen: false);
                  // viewModel.cadastrarUsuario(
                  //   nome: _nomeController.text,
                  //   email: _emailController.text,
                  //   senha: _senhaController.text,
                  //   confirmarSenha: _confirmarSenhaController.text,
                  // );

                  print("Nome digitado: ${_nomeController.text}"); // Apenas para você testar no console
                  _navegarComSuavidade(context, const Scaffold(body: Center(child: Text("Home"))));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Criar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            // ... restante do seu código (divisor e botão Google)
          ],
        ),
      ),
    );
  }

  // FUNÇÃO ATUALIZADA COM CONTROLADOR
  Widget _buildInputField(String label, String hint, TextEditingController controller, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: controller, // <--- CONEXÃO FEITA AQUI
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
          ),
        ),
      ],
    );
  }

  // FUNÇÃO DE SENHA ATUALIZADA COM CONTROLADOR
  Widget _buildPasswordField(String label, bool obscure, TextEditingController controller, VoidCallback onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: controller, // <--- CONEXÃO FEITA AQUI
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: '••••••••',
            suffixIcon: IconButton(
              icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
              onPressed: onToggle,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
          ),
        ),
      ],
    );
  }
}