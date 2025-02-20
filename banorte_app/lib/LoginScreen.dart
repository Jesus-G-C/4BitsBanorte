import 'package:banorte_app/DashboardScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla para adaptarlo
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('LOG IN'),
        backgroundColor: Color(0xFFB7261F), // Rojo Banorte
        elevation: 0, // Quitar sombra del AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB7261F), // Rojo Banorte
              Color(0xFFAD3B2A), // Color secundario
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Ajusta el padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo
            Text(
              'BANORTE',
              style: TextStyle(
                fontSize: screenHeight * 0.12, // Ajusta el tamaño del logo según la altura
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Tipografía más moderna
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // Espacio entre el logo y los campos

            // Campo de email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: const Color.fromARGB(179, 59, 11, 11)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Espacio entre los campos

            // Campo de contraseña
            TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: const Color.fromARGB(179, 59, 11, 11)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
              ),
              obscureText: true,
            ),
            SizedBox(height: screenHeight * 0.02), // Espacio entre los campos

            // Espacio que se expande para llenar la pantalla sin dejar espacio blanco
            Expanded(
              child: Container(),
            ),

            // Botón de login
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB7261F), // Rojo Banorte
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.25),
                elevation: 5,
              ),
              child: Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: screenHeight * 0.025, // Tamaño de fuente ajustado
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 252, 252, 252),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // Espacio al final
          ],
        ),
      ),
    );
  }
}