import 'package:flutter/material.dart';

class MayaScreen extends StatelessWidget {
  const MayaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maya Recomendaciones'),
        backgroundColor: const Color(0xFFFF0000), // Color institucional de Banorte
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Basado en tus hábitos de gasto, podrías ahorrar:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "\$1,200.00 este mes",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Icon(Icons.savings, color: Colors.green, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Consejos para optimizar tu ahorro:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  MayaRecommendationItem(
                    icon: Icons.shopping_cart,
                    title: "Reducir gastos en compras innecesarias",
                    description: "Intenta establecer un presupuesto mensual para compras no esenciales.",
                  ),
                  MayaRecommendationItem(
                    icon: Icons.restaurant,
                    title: "Cocina en casa",
                    description: "Evita gastos excesivos en restaurantes y prueba cocinar más en casa.",
                  ),
                  MayaRecommendationItem(
                    icon: Icons.electric_bolt,
                    title: "Ahorra en servicios",
                    description: "Desconecta dispositivos cuando no los uses y usa focos LED para reducir tu consumo.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Acción para acceder a más detalles de Maya
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Ver más recomendaciones"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Impulsado por Maya",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Image.asset(
                    'assets/ai_logo', // Asegúrate de tener este archivo en la carpeta assets
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MayaRecommendationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const MayaRecommendationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.red, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}