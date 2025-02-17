
import 'package:banorte_app/AccountDetailsScreen.dart';
import 'package:banorte_app/TransferScreen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 173, 39, 29), // Fondo rojo
        child: Center(
          // Asegura que todos los elementos estén centrados
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Saldo Disponible:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '\$5,000,000.00',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransferScreen()),
                    );
                  },
                  child: Text('Realizar Transferencia'),
                ),
                SizedBox(height: 20), // Espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountDetailsScreen()),
                    );
                  },
                  child: Text('Ver Detalles de Cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
