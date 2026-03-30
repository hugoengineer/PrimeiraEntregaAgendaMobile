import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'pt'; // Idioma padrão

  @override
  Widget build(BuildContext context) {
    // Definição de Cores do HTML
    const Color primaryColor = Color(0xFF137FEC);
    //const Color bgLight = Color(0xFFF6F7F8);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF334155)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Configurações', 
          style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho com Ícone e Título
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                  child: const Icon(Icons.language, color: primaryColor, size: 32),
                ),
                const SizedBox(height: 24),
                const Text('Selecione seu Idioma', 
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5)), // FontWeight.w800 para Extrabold
                const SizedBox(height: 8),
                const Text('Escolha o idioma preferido para continuar no Agenda Inteligente.', 
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ),

          // Lista de Opções
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildLanguageOption('pt', 'Português', 'Brasil', primaryColor),
                const SizedBox(height: 16),
                _buildLanguageOption('en', 'English', 'United States', primaryColor),
                const SizedBox(height: 16),
                _buildLanguageOption('es', 'Español', 'España', primaryColor),
              ],
            ),
          ),

          // Rodapé com Botão Confirmar
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    shadowColor: primaryColor.withOpacity(0.4),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Confirmar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.chevron_right, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Você poderá alterar isso mais tarde nas configurações.', 
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String code, String name, String region, Color primary) {
    bool isSelected = _selectedLanguage == code;
    return GestureDetector(
      onTap: () => setState(() => _selectedLanguage = code),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? primary.withOpacity(0.05) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? primary : Colors.grey.shade200, width: 2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(region, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Radio<String>(
              value: code,
              groupValue: _selectedLanguage,
              activeColor: primary,
              onChanged: (val) => setState(() => _selectedLanguage = val!),
            ),
          ],
        ),
      ),
    );
  }
}