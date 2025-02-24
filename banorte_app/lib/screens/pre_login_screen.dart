// screens/pre_login_screen.dart
import 'package:banorte_app/screens/crear_cuenta.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart'; // Import local_auth
import 'dashboard_screen.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({Key? key}) : super(key: key);

  @override
  _PreLoginScreenState createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication(); // Initialize LocalAuthentication

  // Function to authenticate with biometrics
  Future<void> _authenticateWithFaceID() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
        'Escanea tu huella digital o rostro para iniciar sesión en Banorte', // Message shown to the user
        options: const AuthenticationOptions(
          useErrorDialogs: true, // Show error dialogs to the user
          stickyAuth: true,      // Keep authentication session sticky
        ),
      );
    } catch (e) {
      print("Error al autenticar con biometría: $e");
      return; // Exit if there's an error
    }

    if (!mounted) return; // Check if the widget is still in the widget tree

    if (authenticated) {
      if (_userIdController.text.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('ID de usuario requerido para Face ID/Biometría')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fallo en la autenticación biométrica.')),
      );
    }
  }

  // Function to check for biometric availability (optional, for better UX)
  Future<bool> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("Error checking biometrics: $e");
      canCheckBiometrics = false;
    }
    return canCheckBiometrics;
  }

  // Function to get available biometric types (optional, for more info)
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = <BiometricType>[];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print("Available biometrics: $availableBiometrics"); // Log available types
    } catch (e) {
      print("Error listing available biometrics: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    _checkBiometrics().then((biometricsAvailable) {
      if (biometricsAvailable) {
        _getAvailableBiometrics(); // Optional: Log available biometrics
      } else {
        print("Biometrics are not available on this device.");
        // Optionally disable the Face ID login button or show a message.
      }
    });
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
            decoration: const InputDecoration(
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
            onPressed: _authenticateWithFaceID, // Call the biometric auth function
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
          const SizedBox(height: 20),

          // Botón para crear una nueva cuenta
          TextButton(
            onPressed: () {
              // Navega a la pantalla de creación de cuenta
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen()),
              );
            },
            child: const Text(
              'Registrarse',
              style: TextStyle(
                color: Color(0xFFFF0000), // Color rojo
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
 }
}