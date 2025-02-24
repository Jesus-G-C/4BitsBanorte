import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _monthlyIncomeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();

  // Controlador para la firma del contrato
  final TextEditingController _signatureController = TextEditingController();

  // Variable booleana para verificar si el contrato ha sido firmado
  bool isContractSigned = false;

  // Función de validación para el user ID
  String? validateUserId(String? value) {
    RegExp regExp = RegExp(r'^[A-Za-z0-9]{6,}$');
    if (value == null || value.isEmpty) {
      return 'El ID de usuario no puede estar vacío';
    }
    if (!regExp.hasMatch(value)) {
      return 'El ID de usuario debe ser alfanumérico y tener al menos 6 caracteres';
    }
    return null;
  }

  // Función de validación para la contraseña
  String? validatePassword(String? value) {
    RegExp regExp = RegExp(
      r'^(?!.*(\d)\1{2,})(?!.*([a-zA-Z])\2{2,})(?!.*123)(?!.*abc)[A-Za-z\d]{8,}$',
    );
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía';
    }
    if (!regExp.hasMatch(value)) {
      return 'La contraseña debe tener al menos 8 caracteres, incluir una letra y un número, y no tener caracteres consecutivos o repetidos';
    }
    if (value == _userIdController.text) {
      return 'La contraseña no puede ser igual al ID de usuario';
    }
    if (value.toLowerCase().contains('banorte'.toLowerCase())) {
      return 'La contraseña no puede contener el nombre del banco';
    }
    return null;
  }

  // Función de validación para el token
  String? validateToken(String? value) {
    RegExp regExp = RegExp(r'^\d{6}$');
    if (value == null || value.isEmpty) {
      return 'El token no puede estar vacío';
    }
    if (!regExp.hasMatch(value)) {
      return 'El token debe ser exactamente de 6 números';
    }
    return null;
  }

  // Mostrar el contrato en un diálogo emergente
  void _showContractDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contrato de Uso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Este es el contrato de uso de la aplicación. Al firmar, aceptas todas las condiciones descritas aquí.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Contrato: \n\n1. Al crear una cuenta, aceptas los términos de uso.\n'
                '2. La aplicación no se hace responsable por el uso indebido.\n'
                '3. Se prohíbe el uso de la app para fines ilegales.\n'
                '4. Aceptas recibir notificaciones relacionadas con la app.',
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _signatureController,
                decoration: const InputDecoration(
                  labelText: 'Firma (Nombre Completo)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_signatureController.text.isNotEmpty) {
                  setState(() {
                    // Marca el contrato como firmado
                    isContractSigned = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contrato firmado con éxito')),
                  );
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, firme el contrato')),
                  );
                }
              },
              child: const Text('Firmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: const Color(0xFFFF0000), // Color rojo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Registrar nuevo usuario',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Campo de texto para el email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Campo de texto para el ID de usuario
              TextField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  labelText: 'ID de Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de texto para el teléfono
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Número Telefónico',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Campo de texto para la dirección
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de texto para el nombre completo
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de texto para los ingresos mensuales
              TextField(
                controller: _monthlyIncomeController,
                decoration: const InputDecoration(
                  labelText: 'Ingresos Mensuales',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Campo de texto para la contraseña
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              // Campo de texto para el token
              TextField(
                controller: _tokenController,
                decoration: const InputDecoration(
                  labelText: 'Token',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Botón para mostrar el contrato
              ElevatedButton(
                onPressed: _showContractDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000), // Color rojo
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                child: const Text(
                  'Contrato',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Botón para crear la cuenta
              ElevatedButton(
                onPressed: isContractSigned
                    ? () {
                        // Validar los campos antes de proceder
                        String? userIdValidation = validateUserId(_userIdController.text);
                        String? passwordValidation = validatePassword(_passwordController.text);
                        String? tokenValidation = validateToken(_tokenController.text);

                        if (_emailController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty &&
                            _phoneController.text.isNotEmpty &&
                            _addressController.text.isNotEmpty &&
                            _fullNameController.text.isNotEmpty &&
                            _monthlyIncomeController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _tokenController.text.isNotEmpty) {

                          if (userIdValidation == null &&
                              passwordValidation == null &&
                              tokenValidation == null) {
                            // Aquí iría la lógica para guardar los datos de la cuenta
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cuenta creada exitosamente')),
                            );
                          } else {
                            // Mostrar las validaciones
                            if (userIdValidation != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(userIdValidation)),
                              );
                            }
                            if (passwordValidation != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(passwordValidation)),
                              );
                            }
                            if (tokenValidation != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(tokenValidation)),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Por favor, completa todos los campos')),
                          );
                        }
                      }
                    : null, // Deshabilitar si no se firmó el contrato
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000), // Color rojo
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                child: const Text(
                  'Crear Cuenta',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}