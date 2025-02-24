// screens/transfer_screen.dart
import 'package:flutter/material.dart';

// Nueva pantalla de simulación de transferencia
class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();
    final TextEditingController _recipientController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Transferir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 1,000.00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Destinatario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(
                hintText: 'Nombre o Número de cuenta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Simular la transferencia
                if (_amountController.text.isNotEmpty &&
                    _recipientController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Transferencia realizada con éxito')),
                  );
                  Navigator.pop(context); // Regresar al dashboard
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, completa todos los campos')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text(
                'Transferir',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}