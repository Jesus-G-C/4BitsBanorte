import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        backgroundColor: const Color(0xFFFF0000), // Color de fondo de la appBar
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Número de iconos por fila
          crossAxisSpacing: 2, // Espacio horizontal más pequeño entre los íconos
          mainAxisSpacing: 0.1, // Espacio vertical más pequeño entre los íconos
          childAspectRatio: 1, // Relación de aspecto de cada celda (icono + texto)
        ),
        padding: const EdgeInsets.all(8), // Padding más pequeño para mayor compresión
        itemCount: 12,
        itemBuilder: (context, index) {
          // Lista de iconos y textos
          List<Map<String, dynamic>> services = [
            {'icon': Icons.currency_exchange, 'text': 'Retirar Dinero'},
            {'icon': Icons.phone_android, 'text': 'Tiempo aire'},
            {'icon': Icons.account_balance, 'text': 'Trae tu nómina'},
            {'icon': Icons.apple, 'text': 'Apple Wallet'},
            {'icon': Icons.layers, 'text': 'Consultas'},
            {'icon': Icons.local_offer, 'text': 'Promociones'},
            {'icon': Icons.headphones, 'text': 'Centro de ayuda'},
            {'icon': Icons.location_on, 'text': 'Ubicanos'},
            {'icon': Icons.business_center, 'text': 'Dimo'},
            {'icon': Icons.credit_card, 'text': 'Cheques'},
            {'icon': Icons.business, 'text': 'CoDi'},
            {'icon': Icons.help, 'text': 'Ayuda'},
          ];

          return ServiceIcon(
            icon: services[index]['icon'],
            text: services[index]['text'],
            onTap: () {
              // Acción a realizar cuando se toca el icono
            },
          );
        },
      ),
    );
  }
}

class ServiceIcon extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ServiceIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _ServiceIconState createState() => _ServiceIconState();
}

class _ServiceIconState extends State<ServiceIcon> {
  // Variable que controla la escala del icono al ser presionado
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _scale = 0.9; // Reducir el tamaño del icono al ser tocado
        });
      },
      onTapUp: (_) {
        setState(() {
          _scale = 1.0; // Restaurar el tamaño original
        });
        widget.onTap(); // Ejecutar la acción del icono
      },
      onTapCancel: () {
        setState(() {
          _scale = 1.0; // Restaurar el tamaño original si se cancela la acción
        });
      },
      child: Transform.scale(
        scale: _scale, // Aplicar la animación de escala
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 30, // Tamaño de icono más pequeño
              color: const Color(0xFFFF0000), // Color rojo para los iconos
            ),
            const SizedBox(height: 4), // Menor espacio entre el ícono y el texto
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12, // Texto un poco más pequeño
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}