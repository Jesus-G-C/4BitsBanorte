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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController(); // For the token
  final LocalAuthentication auth = LocalAuthentication(); // Initialize LocalAuthentication

  // Function to authenticate with biometrics
  Future<void> _authenticateWithFaceID() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
            'Escanea tu huella digital o rostro para iniciar sesión en Banorte',
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
      if (_userIdController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('ID de usuario y contraseña son requeridos para Face ID/Biometría')),
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
      body: Container(
        color: Colors.white, // White background instead of gradient
        child: Column(
          children: [
            // Red rectangle at the top
            Container(
              height: 80, // Adjust height as needed
              color: const Color(0xFFFF0000), // Red color
            ),
            Expanded(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Banorte Logo
                      Image.asset(
                        'assets/banorte_logo.png',
                        height: 100,
                        width: 300,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error, color: Colors.red, size: 100); // Fallback if logo fails
                        },
                      ),
                      const SizedBox(height: 40),

                      // ID de Usuario TextField
                      TextField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          labelText: 'ID de Usuario',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Contraseña TextField
                      TextField(
                        controller: _passwordController,
                        obscureText: true, 
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Token de Seguridad TextField
                      TextField(
                        controller: _tokenController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Token de Seguridad',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Iniciar Sesión Button
                      ElevatedButton(
                        onPressed: () {
                          if (_userIdController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty &&
                              _tokenController.text.isNotEmpty) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Por favor, ingresa todos los campos')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF0000),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Rounded like in the image
                          ),
                        ),
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Iniciar Sesión con Biometría Button
                      ElevatedButton(
                        onPressed: _authenticateWithFaceID, // Call the biometric auth function
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF0000),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Rounded like in the image
                          ),
                        ),
                        child: const Text(
                          'Iniciar Sesión con Biometría',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Registrarse Button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccountScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFFF0000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Rounded like in the image
                          ),
                        ),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            // Red rectangle at the bottom
            Container(
              height: 80, // Adjust height as needed
              color: const Color(0xFFFF0000), // Red color
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for ForgotPasswordScreen (replace with your actual implementation)
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olvidé mi contraseña'),
      ),
      body: const Center(
        child: Text('Implement Forgot Password functionality here.'),
      ),
    );
  }
}