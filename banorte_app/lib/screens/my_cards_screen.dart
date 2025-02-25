import 'package:flutter/material.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  // Método para mostrar la información detallada de cada tarjeta
  void _showCardDetails(BuildContext context, String cardType, double balance, String cardNumber, String cvc, String expirationDate, String cardHolder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Detalles de la $cardType"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Saldo disponible: \$${balance.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("Número de tarjeta: $cardNumber", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("CVC: $cvc", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("Fecha de vencimiento: $expirationDate", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text("Titular: $cardHolder", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

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
                    // Mostrar detalles de la tarjeta de débito
                    _showCardDetails(context, "Tarjeta de Débito", 45678.90, "1234 5678 9876 1234", "321", "12/24", "Jesús Emiliano Gaspar Cisneros");
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
                    // Mostrar detalles de la tarjeta de crédito
                    _showCardDetails(context, "Tarjeta de Crédito", 3000, "8765 4321 1234 5678", "456", "11/23", "Jesús Emiliano Gaspar Cisneros");
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