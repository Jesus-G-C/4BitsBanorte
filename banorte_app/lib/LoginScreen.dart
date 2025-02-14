
import 'package:banorte_app/DashboardScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOG IN'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 173, 39, 29), // Fondo rojo
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos
          children: <Widget>[
            Text(
              'BANORTE',
              style: TextStyle(
                  fontSize: 150,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50), // Espacio entre el logo y los campos
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true, // Fondo blanco
                fillColor: Colors.white, // Color de fondo blanco
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                filled: true, // Fondo blanco
                fillColor: Colors.white, // Color de fondo blanco
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text('LOG IN'),
            ),
          ],
        ),
      ),
    );
  }
}
