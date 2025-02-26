import 'package:flutter/material.dart';
import 'payment_receipt_generator.dart'; // Importar PaymentReceiptGenerator

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({Key? key}) : super(key: key);

  @override
  _CreditCardPaymentScreenState createState() =>
      _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  void _processPayment() {
    // Validación de los campos de pago (monto, titular de la tarjeta, número de tarjeta)
    if (_amountController.text.isNotEmpty &&
        _cardHolderController.text.isNotEmpty &&
        _cardNumberController.text.isNotEmpty) {
      // Aquí llamas a PaymentReceiptGenerator para generar el recibo en PDF
      PaymentReceiptGenerator.generateReceipt(
        'Tarjeta de Crédito' as BuildContext, // Método de pago
        _amountController.text, // Monto
        _cardHolderController.text, // Nombre del titular
        _cardNumberController.text, // Número de tarjeta
        DateTime.now(), // Fecha del pago
      );

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pago realizado con éxito y recibo generado')),
      );
    } else {
      // Si algún campo está vacío, mostrar error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago con Tarjeta de Crédito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Monto'),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingresa el monto del pago',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Titular de la tarjeta'),
            TextField(
              controller: _cardHolderController,
              decoration: const InputDecoration(
                hintText: 'Ingresa el titular de la tarjeta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Número de tarjeta'),
            TextField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingresa el número de tarjeta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              child: const Text('Realizar Pago'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cambio de 'primary' a 'backgroundColor'
              ),
            ),

          ],
        ),
      ),
    );
  }
}
