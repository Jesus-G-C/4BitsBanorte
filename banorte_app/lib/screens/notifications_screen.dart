
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificaciones"),
        backgroundColor: const Color(0xFFFF0000), // Color institucional de Banorte
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationItem(
            icon: Icons.account_balance_wallet,
            title: "Depósito recibido",
            description: "Has recibido un depósito de \$5,000.00",
            time: "Hace 10 min",
          ),
          NotificationItem(
            icon: Icons.credit_card,
            title: "Pago de tarjeta exitoso",
            description: "Tu pago de \$1,200.00 ha sido procesado.",
            time: "Hace 30 min",
          ),
          NotificationItem(
            icon: Icons.warning,
            title: "Intento de acceso sospechoso",
            description: "Detectamos un intento de acceso desde un dispositivo desconocido.",
            time: "Hace 1 hora",
            isAlert: true,
          ),
          NotificationItem(
            icon: Icons.attach_money,
            title: "Transferencia enviada",
            description: "Has enviado \$800.00 a Liam Saldaña.",
            time: "Hace 3 horas",
          ),
          NotificationItem(
            icon: Icons.lock,
            title: "Cambio de contraseña exitoso",
            description: "Tu contraseña ha sido actualizada correctamente.",
            time: "Ayer",
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool isAlert;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    this.isAlert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isAlert ? Colors.red.shade50 : Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isAlert ? Colors.red : const Color(0xFFFF0000),
          size: 32,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isAlert ? Colors.red.shade900 : Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}