import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cores extraídas do seu HTML
    const Color primaryColor = Color(0xFF137FEC);
    const Color backgroundLight = Color(0xFFF6F7F8);
    const Color zinc100 = Color(0xFFF4F4F5);
    const Color zinc500 = Color(0xFF71717A);
    const Color zinc900 = Color(0xFF18181B);

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.menu, color: Colors.black87),
        title: const Text(
          'Terça-feira, 28 de Maio',
          style: TextStyle(color: zinc900, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Pesquisa
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: zinc100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar compromissos...',
                  prefixIcon: Icon(Icons.search, color: zinc500),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          
          // Lista de Eventos
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildEventCard('09:00', 'Reunião de Alinhamento Semanal', 'Trabalho', Colors.yellow),
                _buildEventCard('12:30', 'Almoço com o Cliente', 'Pessoal', Colors.purple),
                _buildEventCard('18:00', 'Consulta Médica', 'Saúde', Colors.orange),
                
                const SizedBox(height: 20),
                
                // Empty State
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.event_available, size: 60, color: primaryColor),
                      const SizedBox(height: 16),
                      const Text('Nenhum compromisso hoje', 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF27272A))),
                      const Text('Aproveite o dia livre ou toque no \'+\' para adicionar um novo evento.', 
                        textAlign: TextAlign.center, style: TextStyle(color: zinc500)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildEventCard(String time, String title, String category, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
      ),
      child: Row(
        children: [
          Container(
            width: 6, 
            height: 40, 
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(color: Color(0xFF71717A), fontWeight: FontWeight.bold, fontSize: 12)),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF18181B))),
                Text(category, style: const TextStyle(color: Color(0xFF52525B), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Color(0xFF71717A)),
        ],
      ),
    );
  }
}