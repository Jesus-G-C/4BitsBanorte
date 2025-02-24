// screens/my_cards_screen.dart
import 'package:flutter/material.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text("Mis Tarjetas"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tarjeta de Débito
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.green),
                title: const Text("Tarjeta de Débito"),
                subtitle: const Text("**** 1234"),
                trailing: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    // Acción al presionar
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tarjeta de Crédito
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.blue),
                title: const Text("Tarjeta de Crédito"),
                subtitle: const Text("**** 5678"),
                trailing: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    // Acción al presionar
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}