import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cores extraídas do seu HTML
    const Color primaryColor = Color(0xFF4A90E2);
    const Color backgroundLight = Color(0xFFF8F9FA);
    const Color textMain = Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new, color: textMain, size: 20),
        title: const Text('Outubro 2024', 
          style: TextStyle(color: textMain, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.arrow_forward_ios, color: textMain, size: 20),
          ),
        ],
      ),
      body: Column(
        children: [
          // Segmented Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  _buildSegmentItem('Mês', isSelected: true),
                  _buildSegmentItem('Semana'),
                  _buildSegmentItem('Hoje'),
                ],
              ),
            ),
          ),

          // Grade do Calendário
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildWeekDaysRow(),
                const SizedBox(height: 8),
                _buildCalendarGrid(primaryColor),
              ],
            ),
          ),

          const Spacer(),

          // Painel de Agenda Inferior
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Hoje, 26 de Outubro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildAgendaItem('Reunião de Projeto', '14:00 - 15:00', Colors.yellow[700]!),
                _buildAgendaItem('Consulta Médica', '16:30 - 17:00', Colors.green[500]!),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }

  // Widgets Auxiliares (Devem estar dentro da classe)
  Widget _buildSegmentItem(String text, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text, textAlign: TextAlign.center, 
          style: TextStyle(fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500)),
      ),
    );
  }

  Widget _buildWeekDaysRow() {
    final days = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((d) => Text(d, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 13))).toList(),
    );
  }

  Widget _buildCalendarGrid(Color primary) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemCount: 31,
      itemBuilder: (context, index) {
        int day = index + 1;
        bool isToday = day == 26;
        return Center(
          child: Container(
            width: 36, height: 36,
            decoration: BoxDecoration(color: isToday ? primary : Colors.transparent, shape: BoxShape.circle),
            child: Center(child: Text('$day', style: TextStyle(color: isToday ? Colors.white : Colors.black))),
          ),
        );
      },
    );
  }

  Widget _buildAgendaItem(String title, String time, Color tagColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF8F9FA), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(width: 4, height: 32, decoration: BoxDecoration(color: tagColor, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}