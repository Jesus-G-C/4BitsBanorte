import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

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
                fontWeight: FontWeight.bold
              ),
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
        child: Center( // Asegura que todos los elementos estén centrados
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Saldo Disponible:',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
                      MaterialPageRoute(builder: (context) => AccountDetailsScreen()),
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
                      SnackBar(content: Text('Transferencia Realizada Exitosamente')),
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

class AccountDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles de Cuenta')),
      body: Container(
        color: const Color.fromARGB(255, 173, 39, 29), // Fondo rojo
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nombre del Titular: Jesús Gaspar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Número de Cuenta: 07073960',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Tipo de Cuenta: Ahorros',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}