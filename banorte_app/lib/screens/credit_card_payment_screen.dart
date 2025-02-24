// screens/credit_card_payment_screen.dart
import 'package:flutter/material.dart';

// Nueva pantalla de pago de tarjeta de crédito
class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({Key? key}) : super(key: key);

  @override
  _CreditCardPaymentScreenState createState() =>
      _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  double debt = 1500.00; // Monto inicial del adeudo
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Pagar Tarjeta de Crédito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de ícono de tarjeta con adeudo
            Row(
              children: [
                const Icon(Icons.credit_card,
                    size: 40, color: Color(0xFFFF0000)),
                const SizedBox(width: 12),
                Text(
                  'Adeudo: \$${debt.toStringAsFixed(2)}', // Mostrar el adeudo actualizado
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Monto a Pagar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 1,000.00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_amountController.text.isNotEmpty) {
                  double amountToPay =
                      double.tryParse(_amountController.text) ?? 0.0;

                  if (amountToPay > 0 && amountToPay <= debt) {
                    setState(() {
                      debt -= amountToPay; // Restar el monto del adeudo
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pago realizado con éxito')),
                    );
                    _amountController
                        .clear(); // Limpiar el campo de texto después de pagar
                  } else if (amountToPay > debt) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'El monto a pagar no puede ser mayor al adeudo')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, ingresa el monto a pagar')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text('Pagar', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}