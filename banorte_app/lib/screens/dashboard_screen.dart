import 'package:banorte_app/screens/maya_screen.dart';
import 'package:banorte_app/screens/notifications_screen.dart';
import 'package:banorte_app/screens/perfil_screen.dart';
import 'package:banorte_app/screens/services_screen.dart';
import 'package:banorte_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard_content_widgets.dart';
import 'my_cards_screen.dart';
import 'transfer_screen.dart';
import 'credit_card_payment_screen.dart';
import 'spei_transfer_info_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
     DashboardContent(), // Contenido del Dashboard
     MyCardsScreen(),    // Contenido de Mis Tarjetas
     MayaScreen(),       //Contenido de Maya
     ServicesScreen(),
     MyProfileScreen(),  //Contenido de Perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Mostrar la pantalla correspondiente
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFF0000),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemTapped, // Cambiar pantalla al tocar un ítem
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          const BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Tarjetas'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/maya_logo.png', 
              width: 30, 
              height: 30,
              ),
              label: 'Maya',
            ),
          const BottomNavigationBarItem(icon: Icon(Icons.extension), label: 'Servicios'),
          const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
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
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                  );
                },
              ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                    Navigator.push(
                      context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                    },
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
                        ActionButton(
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
                        ActionButton(
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
                        ActionButton(
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
                          },
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
                            ExpenseItem(
                              label: 'Netflix',
                              amount: '\$199.00',
                            ),
                            const SizedBox(height: 8),
                            ExpenseItem(
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
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MayaScreen()),
                                );
                              },
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

                    // Anuncios
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color(0xEFE0AB55),
                      margin: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          const Text(
                            '¡No te pierdas las últimas ofertas!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Aprovecha descuentos exclusivos en nuestras plataformas de pago. ¡Haz clic aquí para más detalles!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Agregar acción al botón
                            },
                            child: const Text('Ver Ofertas'),
                          ),
                        ],
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