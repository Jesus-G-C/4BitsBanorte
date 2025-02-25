import 'package:flutter/material.dart';

class MayaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maya'),
        backgroundColor: Color(0xFFFF0000), // Color rojo de Maya
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star, // Icono que representa algo importante de Maya
              size: 100,
              color: Colors.amber,
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenido a Maya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Aquí puedes gestionar tu contenido exclusivo de Maya.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            // Agrega cualquier otro widget relacionado con Maya
            ElevatedButton(
              onPressed: () {
                // Aquí puedes poner alguna acción al presionar un botón, si es necesario
              },
              child: Text('Acceder'),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF0000)),
            ),
          ],
        ),
      ),
    );
  }
}