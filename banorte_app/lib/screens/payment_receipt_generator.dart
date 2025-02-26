import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PaymentReceiptGenerator {
  // Método para generar el comprobante de pago en PDF
  static Future<void> generateReceipt(BuildContext context, String amount, String recipient, String ) async {
    try {
      // Crear el documento PDF
      final pdf = pw.Document();

      // Agregar una página al PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text('Comprobante de Pago', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 20),
                  pw.Text('Monto: \$${amount}'),
                  pw.Text('Destinatario: ${recipient}'),
                  pw.Text('Fecha y Hora: ${DateTime.now()}'),
                ],
              ),
            );
          },
        ),
      );

      // Obtener el directorio de almacenamiento temporal del dispositivo
      final outputDir = await getTemporaryDirectory();
      final outputFile = File('${outputDir.path}/payment_receipt_${DateTime.now().millisecondsSinceEpoch}.pdf');

      // Guardar el PDF en el dispositivo
      await outputFile.writeAsBytes(await pdf.save());

      // Mostrar una notificación al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comprobante generado')),
      );

      // Imprimir o abrir el PDF (opcional)
      await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());

    } catch (e) {
      // Manejo de errores si algo sale mal
      print("Error al generar el comprobante: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al generar el comprobante')),
      );
    }
  }

  // Método para generar el comprobante de pago sin abrir el PDF para impresión
  static Future<void> generateReceiptWithoutPreview(
      BuildContext context, String amount, String recipient) async {
    try {
      // Crear el documento PDF
      final pdf = pw.Document();

      // Agregar una página al PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text('Comprobante de Pago', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 20),
                  pw.Text('Monto: \$${amount}'),
                  pw.Text('Destinatario: ${recipient}'),
                  pw.Text('Fecha y Hora: ${DateTime.now()}'),
                ],
              ),
            );
          },
        ),
      );

      // Obtener el directorio de almacenamiento temporal del dispositivo
      final outputDir = await getTemporaryDirectory();
      final outputFile = File('${outputDir.path}/payment_receipt_${DateTime.now().millisecondsSinceEpoch}.pdf');

      // Guardar el PDF en el dispositivo
      await outputFile.writeAsBytes(await pdf.save());

      // Mostrar una notificación al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comprobante generado')),
      );
    } catch (e) {
      // Manejo de errores si algo sale mal
      print("Error al generar el comprobante: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al generar el comprobante')),
      );
    }
  }
}
