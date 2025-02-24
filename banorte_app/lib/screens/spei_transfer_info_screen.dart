// screens/spei_transfer_info_screen.dart
import 'package:flutter/material.dart';

class SpeiTransferInfoScreen extends StatelessWidget {
  const SpeiTransferInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Información de Transferencia SPEI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos de la Cuenta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nombre del Beneficiario:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Jesús Gaspar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'CLABE Interbancaria:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '032180000118362426',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Banco:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Banorte',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Volver a la pantalla anterior
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text('Volver', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}