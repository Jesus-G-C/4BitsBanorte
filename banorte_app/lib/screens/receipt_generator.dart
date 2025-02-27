import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class ReceiptGenerator {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize Notifications
  static void initializeNotifications() async {
    const AndroidInitializationSettings androidInit =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosInit = DarwinInitializationSettings();

    final InitializationSettings initSettings =
    InitializationSettings(android: androidInit, iOS: iosInit);

    await _notificationsPlugin.initialize(initSettings);

    // Request permissions for iOS
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  static Future<void> generateReceipt({
    required String senderName,
    required String senderClabe,
    required String recipientName,
    required String recipientClabe,
    required double amount,
  }) async {
    try {
      // Get formatted date
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

      // Create PDF document
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text("Comprobante de Pago",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Text("Fecha y Hora: $formattedDate"),
                  pw.Text("Emisor: $senderName"),
                  pw.Text("CLABE: $senderClabe"),
                  pw.Text("Receptor: $recipientName"),
                  pw.Text("CLABE Destino: $recipientClabe"),
                  pw.Text("Monto: \$${amount.toStringAsFixed(2)}"),
                  pw.SizedBox(height: 20),
                  pw.Text("Gracias por usar Banorte"),
                ],
              ),
            );
          },
        ),
      );

      // Save PDF to the appropriate directory
      Directory directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download'); // Downloads folder
      } else {
        directory = await getApplicationDocumentsDirectory(); // iOS alternative
      }

      final String path = '${directory.path}/comprobante_pago.pdf';
      final File file = File(path);
      await file.writeAsBytes(await pdf.save());

      // Show notification
      _showNotification();

      print("PDF guardado en: $path");
    } catch (e) {
      print("Error al generar el PDF: $e");
    }
  }

  // Show Notification
  static Future<void> _showNotification() async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'comprobante_pago',
      'Comprobantes',
      channelDescription: 'Notificaciones de generación de comprobantes',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details =
    NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      0,
      'Generando ticket',
      'El comprobante de pago se ha generado correctamente',
      details,
    );
  }
}
