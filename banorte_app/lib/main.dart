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
      home:
          const PreLoginScreen(), // Cambiado para mostrar la pantalla de pre-login
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
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, ingresa un ID de Usuario')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000), // Color rojo
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(), // Contenido del Dashboard
    const MyCardsScreen(),    // Contenido de Mis Tarjetas
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navigation Bar
      body: _screens[_currentIndex], // Mostrar la pantalla correspondiente
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFF0000),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemTapped, // Cambiar pantalla al tocar un ítem
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

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

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
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
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
                          onPressed: () {
                            // Navegar a la pantalla de transferencia
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TransferScreen()),
                            );
                          },
                        ),
                        _ActionButton(
                          icon: Icons.credit_card,
                          label: 'Pagar',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreditCardPaymentScreen()));
                          },
                        ),
                        _ActionButton(
                            icon: Icons.email,
                            label: 'Recibir',
                            onPressed: () {
                              // Navegar a la pantalla de información de transferencia SPEI
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SpeiTransferInfoScreen()),
                              );
                            }),
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
                            // Navegar a la pantalla de mis tarjetas
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyCardsScreen()),
                            );
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

// Nueva pantalla de simulación de transferencia
class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _amountController = TextEditingController();
    final TextEditingController _recipientController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Transferir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monto',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 1,000.00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Destinatario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(
                hintText: 'Nombre o Número de cuenta',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Simular la transferencia
                if (_amountController.text.isNotEmpty &&
                    _recipientController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Transferencia realizada con éxito')),
                  );
                  Navigator.pop(context); // Regresar al dashboard
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, completa todos los campos')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text(
                'Transferir',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class SpeiTransferInfoScreen extends StatelessWidget {
  const SpeiTransferInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF0000),
        title: const Text('Información de Transferencia SPEI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos de la Cuenta',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nombre del Beneficiario:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Jesús Gaspar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'CLABE Interbancaria:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '032180000118362426',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Banco:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Banorte',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Volver a la pantalla anterior
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text('Volver', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

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
                    // Acción al presionar
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
                    // Acción al presionar
                  ElevatedButton(
              onPressed: () {
                // Volver a la pantalla anterior
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: const Text('Volver', style: TextStyle(fontSize: 16)),
                    );
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

