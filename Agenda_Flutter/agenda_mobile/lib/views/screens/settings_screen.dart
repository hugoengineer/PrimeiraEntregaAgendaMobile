import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSizeValue = 40.0;
  bool _highContrast = false;
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    // Cores baseadas no seu novo HTML
    const Color primaryColor = Color(0xFF607AFB);
    const Color bgLight = Color(0xFFF5F6F8);
    const Color textMain = Color(0xFF1E293B);

    return Scaffold(
      backgroundColor: bgLight,
      appBar: AppBar(
        backgroundColor: bgLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textMain),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Configurações', 
          style: TextStyle(color: textMain, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Perfil do Utilizador
            _buildProfileSection(),

            _buildSectionTitle('CONTA'),
            _buildSettingsGroup([
              _buildSettingsTile(Icons.lock, 'Alterar Senha', primaryColor),
            ]),

            _buildSectionTitle('ACESSIBILIDADE'),
            _buildSettingsGroup([
              _buildSettingsTile(Icons.language, 'Alterar Idioma', primaryColor),
              _buildToggleTile(Icons.contrast, 'Modo de Alto Contraste', _highContrast, (val) {
                setState(() => _highContrast = val);
              }, primaryColor),
              _buildSliderTile(Icons.format_size, 'Tamanho da Fonte', primaryColor),
            ]),

            _buildSectionTitle('NOTIFICAÇÕES'),
            _buildSettingsGroup([
              _buildToggleTile(Icons.notifications, 'Notificações Push', _pushNotifications, (val) {
                setState(() => _pushNotifications = val);
              }, primaryColor),
              _buildSettingsTile(Icons.event, 'Lembretes de Eventos', primaryColor),
              _buildSettingsTile(Icons.task_alt, 'Notificações de Tarefas', primaryColor),
            ]),

            // Botão Sair
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text('Sair', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widgets Auxiliares (Dentro da Classe para evitar erros) ---

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alexandre Costa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('alexandre.costa@email.com', style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.edit, color: Colors.grey), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(title, style: const TextStyle(color: Color(0xFF607AFB), fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)), // FontWeight corrigido
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget _buildToggleTile(IconData icon, String title, bool value, Function(bool) onChanged, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: Switch(value: value, activeColor: color, onChanged: onChanged),
    );
  }

  Widget _buildSliderTile(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 16),
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
          Slider(
            value: _fontSizeValue,
            max: 100,
            activeColor: color,
            onChanged: (val) => setState(() => _fontSizeValue = val),
          ),
        ],
      ),
    );
  }
}