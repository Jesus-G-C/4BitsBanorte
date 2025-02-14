import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferir Dinero')),
      body: Container(
        color: const Color.fromARGB(255, 173, 39, 29), // Fondo rojo
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Número de Cuenta',
                    filled: true, // Fondo blanco
                    fillColor: Colors.white, // Color de fondo blanco
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Monto a Transferir',
                    filled: true, // Fondo blanco
                    fillColor: Colors.white, // Color de fondo blanco
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Simula una transferencia
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Transferencia Realizada Exitosamente')),
                    );
                  },
                  child: Text('Transferir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
