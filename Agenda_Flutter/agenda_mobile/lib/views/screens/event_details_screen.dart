import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  // Função para transição suave (Fade)
  void _voltarComSuavidade(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Cores extraídas do seu HTML
    const Color primaryColor = Color(0xFF137FEC);
    const Color backgroundLight = Color(0xFFF6F7F8);
    const Color slate600 = Color(0xFF475569);
    const Color slate900 = Color(0xFF0F172A);

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: slate900),
          onPressed: () => _voltarComSuavidade(context),
        ),
        title: const Text(
          'Detalhes do Compromisso',
          style: TextStyle(color: slate900, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card Principal
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Reunião de Alinhamento Semanal',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: slate900),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Trabalho', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Sex, 25 de Out. | 14:00 - 15:30', style: TextStyle(color: slate600, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Lista de detalhes com ícones
            _buildInfoRow(Icons.notifications_active_outlined, '30 minutos antes'),
            const Divider(height: 1),
            _buildInfoRow(Icons.location_on_outlined, 'Rua das Flores, 123, Sala 4', hasChevron: true),
            const Divider(height: 1),
            _buildInfoRow(Icons.event_available_outlined, 'Projeto X'),
            const Divider(height: 1),

            // Descrição
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _iconBox(Icons.description_outlined),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Discutir o progresso das tarefas da sprint atual e planejar os próximos passos.',
                      style: TextStyle(color: slate600, fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Barra de botões inferior
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                label: const Text('Excluir', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 48), // CORREÇÃO DO ERRO DO PRINT
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.white),
                label: const Text('Editar', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 48),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, color: const Color(0xFF64748B)),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {bool hasChevron = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _iconBox(icon),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16, color: Color(0xFF1E293B)))),
          if (hasChevron) const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}