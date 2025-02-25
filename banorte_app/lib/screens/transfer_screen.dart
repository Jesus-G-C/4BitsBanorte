// screens/transfer_screen.dart
import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _finishTransfer() {
    if (_amountController.text.isNotEmpty && _recipientController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transferencia realizada con éxito')),
      );
      Navigator.pop(context); // Regresar al dashboard
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            // Animación de las etapas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _stepIndicator(0, 'Cuenta Origen'),
                _stepIndicator(1, 'Cuenta Destino'),
                _stepIndicator(2, 'Confirmar'),
              ],
            ),
            const SizedBox(height: 20),

            // Mostrar las etapas usando PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  // Etapa 1: Cuenta Origen
                  _stepContent('Monto', _amountController),
                  // Etapa 2: Cuenta Destino
                  _stepContent('Destinatario', _recipientController),
                  // Etapa 3: Confirmar
                  _confirmStep(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Botones para navegar entre las etapas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: _previousStep,
                    child: const Text('Anterior'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                    ),
                  ),
                if (_currentStep < 2)
                  ElevatedButton(
                    onPressed: _nextStep,
                    child: const Text('Siguiente'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                    ),
                  ),
                if (_currentStep == 2)
                  ElevatedButton(
                    onPressed: _finishTransfer,
                    child: const Text('Confirmar Transferencia'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF0000),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepIndicator(int step, String label) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: _currentStep >= step ? 100 : 80,
      height: 40,
      decoration: BoxDecoration(
        color: _currentStep >= step
            ? const Color(0xFFFF0000) // Rojo para etapas activas
            : const Color(0xFFE0E0E0), // Gris para etapas no activas
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: _currentStep >= step ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _stepContent(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ingresa el valor aquí',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _confirmStep() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirmar Transferencia',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text('Monto: \$${_amountController.text}'),
          Text('Destinatario: ${_recipientController.text}'),
        ],
      ),
    );
  }
}