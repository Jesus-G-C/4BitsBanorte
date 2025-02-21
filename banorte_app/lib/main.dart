import 'package:flutter/material.dart';

void main() {
  runApp(const BanorteApp());
}

class BanorteApp extends StatelessWidget {
  const BanorteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banorte',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF0000),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PreLoginScreen(),  // Cambiado para mostrar la pantalla de pre-login
    );
  }
}

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({Key? key}) : super(key: key);

  @override
  _PreLoginScreenState createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  final TextEditingController _userIdController = TextEditingController();

  // Simula el proceso de "autenticación" con Face ID
  void _authenticateWithFaceID() {
    if (_userIdController.text.isNotEmpty) {
      // Simula la autenticación con Face ID
      // En este ejemplo, simplemente redirigimos al dashboard si el ID de usuario no está vacío.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un ID de Usuario')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Banorte',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF0000),
              ),
            ),
            const SizedBox(height: 40),

            // Campo de texto para el ID de usuario
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(
                labelText: 'ID de Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Botón para iniciar sesión con ID de usuario
            ElevatedButton(
              onPressed: () {
                if (_userIdController.text.isNotEmpty) {
                  // Aquí puedes agregar validación para el ID de usuario
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingresa un ID de Usuario')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000), // Color rojo
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // Botón que simula el inicio de sesión con Face ID
            ElevatedButton(
              onPressed: _authenticateWithFaceID,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000), // Color rojo
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text(
                'Iniciar sesión con Face ID',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFFF0000),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Banorte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Balance Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Saldo Total',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '\$45,678.90',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Actualizado hace 5 minutos',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ActionButton(
                          icon: Icons.attach_money,
                          label: 'Transferir',
                          onPressed: () {},
                        ),
                        _ActionButton(
                          icon: Icons.credit_card,
                          label: 'Pagar',
                          onPressed: () {},
                        ),
                        _ActionButton(
                          icon: Icons.email,
                          label: 'Recibir',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // My Cards Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF0000),
                        borderRadius:
                            BorderRadius.circular(16), // Bordes redondeados
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Acción cuando el botón sea presionado
                          },
                          borderRadius:
                              BorderRadius.circular(16), // Bordes redondeados
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Mis Tarjetas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Automatic Expenses
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Gastos Domiciliados',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _ExpenseItem(
                              label: 'Netflix',
                              amount: '\$199.00',
                            ),
                            const SizedBox(height: 8),
                            _ExpenseItem(
                              label: 'Luz CFE',
                              amount: '\$450.00',
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                  // Maya Recommendations
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Maya',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Basado en tus hábitos de gasto, podrías ahorrar: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '\$1,200.00 este mes',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFFFF0000),
                                padding: EdgeInsets.zero,
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Ver detalles'),
                                  Icon(Icons.arrow_outward, size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFF0000),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Tarjetas'),
          BottomNavigationBarItem(
              icon: Text('M',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFFF0000))),
              label: 'Maya'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  final String label;
  final String amount;

  const _ExpenseItem({
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}