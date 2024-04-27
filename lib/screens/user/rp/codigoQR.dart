import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:html' as html;

import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';


class myQR extends StatelessWidget {
  Jugadores usuario;
  myQR({super.key, required this.usuario});
  String path_img='images/qr_img.png';

  @override
  Widget build(BuildContext context) {
    Key renderObjectKey = Key('ImageQrCode');

    return Scaffold(
      floatingActionButton:Stack(
        children: [
          Positioned(
            bottom: 80.0, // Ajusta según sea necesario
            right: 10.0, // Ajusta según sea necesario
            child: FloatingActionButton(
              child: Icon(Icons.download,color: Colors.white, size: 25,),
              onPressed: () {
                downloadQR();
              },
              backgroundColor: fucsia, // Color de fondo del botón flotante
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Hace que el botón sea redondo
              ),
              mini: true,
            ),
          ),
          Positioned(
            bottom: 0.0, // Ajusta según sea necesario
            right: 0.0, // Ajusta según sea necesario
            child: FloatingActionButton(
              child: Icon(Icons.share,color: Colors.white,),
              onPressed: ()async{
                final qrCodeData = await generateQRCode('Tu texto aquí');
                shareQRCode(qrCodeData, '');
              },
              backgroundColor: fucsia,
            ),
          ),

        ],
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mi código QR:', style: TextStyle(fontSize: 25),),
            SizedBox(height: 50,),
            Container(
              child: RepaintBoundary(
                key: renderObjectKey,
                child: QrImageView(
                  data: usuario.id.toString(),
                  version: QrVersions.auto,
                  size: 350.0,
                  gapless: true,
                  errorStateBuilder: (ctx,err){
                    return const Center(
                    child: Text('Algo salió mal!!!', textAlign: TextAlign.center),
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
  
  void downloadQR() async {
    try {
      final imagen = await QrPainter(
        data: usuario.id.toString(), 
        version: QrVersions.auto,
        eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square),
        dataModuleStyle: QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square),
        color: Colors.black,
        emptyColor: Colors.white,
        gapless: true,
        errorCorrectionLevel: QrErrorCorrectLevel.L
      ).toImage(500); 
      
      var byteData = await imagen.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      
      html.Blob blob = html.Blob([pngBytes]);
      String url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement anchor = html.AnchorElement(href:url)
      ..target = 'images'
      ..download = 'qr_img.png'
      ..click();
      html.Url.revokeObjectUrl(url);

    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Función para generar la imagen del código QR
  Future<Uint8List> generateQRCode(String data) async {
    final qrValidationResult = QrValidator.validate(
      data: data,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    if (qrValidationResult.status == QrValidationStatus.valid) {
      final QrCode qrCode = qrValidationResult.qrCode!;
      final painter = QrPainter.withQr(
        qr: qrCode,
        color: const Color(0xFF000000), // Color del QR
        emptyColor: const Color(0xFFFFFFFF), // Color de fondo
        gapless: false,
      );
      final picture = await painter.toPicture(200);
      final image = await picture.toImage(200, 200);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } else {
      throw Exception('Invalid QR code data');
    }
  }

  // Función para crear un enlace de descarga y compartir por WhatsApp
  void shareQRCode(Uint8List qrCodeData, String phoneNumber) {
    final blob = html.Blob([qrCodeData]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'qr_code.png')
      ..click();
    html.Url.revokeObjectUrl(url);

    // Construye la URL de WhatsApp
    final whatsappUrl = 'https://wa.me/$phoneNumber?text=Adjunto%20el%20código%20QR&attachment=$url';
    html.window.open(whatsappUrl, 'WhatsApp');
  }

}
