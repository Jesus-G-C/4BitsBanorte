import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuraciones"),
        backgroundColor: const Color(0xFFFF0000), // Color institucional de Banorte
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(title: "Cuenta"),
          SettingsItem(
            icon: Icons.account_circle,
            title: "Perfil",
            subtitle: "Gestiona tu información personal",
            onTap: () {
              // Navegar a la pantalla de perfil
            },
          ),
          SettingsItem(
            icon: Icons.lock,
            title: "Seguridad",
            subtitle: "Cambia tu contraseña o activa autenticación biométrica",
            onTap: () {
              // Navegar a opciones de seguridad
            },
          ),
          SettingsItem(
            icon: Icons.notifications,
            title: "Notificaciones",
            subtitle: "Configura alertas y notificaciones",
            onTap: () {
              // Navegar a configuraciones de notificaciones
            },
          ),
          const Divider(),
          const SectionTitle(title: "Preferencias"),
          SettingsSwitchItem(
            icon: Icons.dark_mode,
            title: "Modo oscuro",
            subtitle: "Activa o desactiva el modo oscuro",
            value: false,
            onChanged: (bool value) {
              // Cambiar estado del modo oscuro
            },
          ),
          SettingsItem(
            icon: Icons.language,
            title: "Idioma",
            subtitle: "Selecciona el idioma de la app",
            onTap: () {
              // Navegar a selección de idioma
            },
          ),
          const Divider(),
          const SectionTitle(title: "Soporte"),
          SettingsItem(
            icon: Icons.help_outline,
            title: "Centro de ayuda",
            subtitle: "Encuentra respuestas y asistencia",
            onTap: () {
              // Abrir centro de ayuda
            },
          ),
          SettingsItem(
            icon: Icons.phone,
            title: "Llamar a Banorte",
            subtitle: "Atención al cliente 24/7",
            onTap: () {
              // Acción para llamar a servicio al cliente
            },
          ),
          const Divider(),
          SettingsItem(
            icon: Icons.exit_to_app,
            title: "Cerrar sesión",
            subtitle: "Salir de tu cuenta de Banorte",
            isDestructive: true,
            onTap: () {
              // Lógica para cerrar sesión
            },
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black54),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isDestructive ? Colors.red : Colors.black87)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class SettingsSwitchItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.black54),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      ),
    );
  }
}