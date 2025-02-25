import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importamos el paquete para seleccionar imágenes
import 'dart:io'; // Necesario para manejar los archivos de imagen

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  File? _image; // Variable para almacenar la imagen seleccionada

  // Función para seleccionar una imagen desde la galería o cámara
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    
    // Elegir entre tomar una foto o seleccionar una de la galería
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // También puedes usar ImageSource.camera
    );
    
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Almacenar la imagen seleccionada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(  // Centrar todo el contenido en el cuerpo
        child: SingleChildScrollView(  // Permite desplazarse si el contenido es más grande que la pantalla
          child: Padding(
            padding: const EdgeInsets.all(16.0),  // Añadir espacio alrededor
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Centrar el contenido verticalmente
              crossAxisAlignment: CrossAxisAlignment.center,  // Centrar el contenido horizontalmente
              children: <Widget>[
                // Mostrar la foto de perfil
                GestureDetector(
                  onTap: _pickImage, // Al tocar la foto se podrá cambiar
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.camera_alt, color: Colors.white, size: 30)
                        : null, // Icono de cámara si no hay imagen seleccionada
                  ),
                ),
                SizedBox(height: 20),
                
                // Nombre de usuario
                Text(
                  'Nombre del Usuario',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                
                // Correo electrónico
                Text(
                  'gsus@banorte.mx',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),

                // Número de teléfono
                Text(
                  '+52 (33) 1949 0649',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),

                // Botón "Eliminar cuenta"
                ElevatedButton(
                  onPressed: () {
                    _showDeleteAccountDialog(context);
                  },
                  child: Text('Eliminar cuenta'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Función para mostrar la ventana emergente de confirmación
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar cuenta'),
          content: Text('¿Estás seguro de que deseas eliminar tu cuenta?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo si se cancela
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí agregarías la lógica para eliminar la cuenta
                Navigator.of(context).pop(); // Cerrar el diálogo
                // Realizar la eliminación de la cuenta o redirigir al usuario
                _showAccountDeleted(context); // Mostrar mensaje de cuenta eliminada
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar una ventana emergente tras eliminar la cuenta
  void _showAccountDeleted(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cuenta eliminada'),
          content: Text('Tu cuenta ha sido eliminada con éxito.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}