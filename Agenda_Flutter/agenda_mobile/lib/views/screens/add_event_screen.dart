import 'package:flutter/material.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  void _voltarComSuavidade(BuildContext context, Widget destino) {
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
    // Cores extraídas do seu novo HTML
    const Color primaryColor = Color(0xFF007AFF);
    const Color backgroundLight = Color(0xFFF6F7F8);
    const Color inputColor = Color(0xFFE7EDF3);
    //const Color actionGreen = Color(021183201305); // #34C759 no HTML

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        title: const Text('Novo Compromisso', 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Título'),
            _buildTextField('Reunião de equipe'),
            
            const SizedBox(height: 16),
            _buildLabel('Data'),
            _buildTextFieldWithIcon('25 de Outubro de 2024', Icons.calendar_today),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Hora de Início'),
                    _buildTextField('10:00'),
                  ],
                )),
                const SizedBox(width: 16),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Hora de Fim'),
                    _buildTextField('11:00'),
                  ],
                )),
              ],
            ),

            const SizedBox(height: 16),
            _buildLabel('Descrição'),
            _buildTextField('Discutir resultados...', maxLines: 4),

            const SizedBox(height: 24),
            _buildLabel('Alarme'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notificar-me', style: TextStyle(fontSize: 16)),
                  Switch(value: true, onChanged: (v) {}, activeColor: primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
      // Footer com os botões
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context), // Volta simples
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text('Cancelar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Simula salvar e volta suave para a Home
                    // Substitua 'Placeholder()' pela sua HomeScreen
                    _voltarComSuavidade(context, const Placeholder());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF34C759), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text('Salvar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widgets auxiliares para manter o estilo
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFE7EDF3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(String value, IconData icon) {
    return TextField(
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDF3),
        suffixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}