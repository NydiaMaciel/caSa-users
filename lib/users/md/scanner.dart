import 'package:demo_casa_3/users/md/mobile/registerQR.dart';
import 'package:demo_casa_3/users/md/qrScannerOverlay.dart';
import 'package:demo_casa_3/users/md/scanQR.dart';
import 'package:flutter/material.dart';
//import 'dart:ui_web';
import 'dart:ui';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

String url='url';

class Scanner extends StatefulWidget {
  String usuario;
  Scanner({super.key, required this.usuario});


  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GFButton(
              onPressed: (){
                cameraController.switchCamera();
              },
              text: 'Scanner',
              icon: const Icon(Icons.camera_rear_outlined),
              type: GFButtonType.transparent,
              color: Colors.deepPurple,
            ),
            Container(
              height: 500,
              child: Stack(
                children: [
                  MobileScanner(
                    allowDuplicates: false,
                    controller: cameraController,
                    onDetect: (barcode, args) {
                      final String? code = barcode.rawValue;
                      debugPrint('Barcode found! $code');
                      setState(() {
                        url=code.toString();
                        //Navigator.push(context,MaterialPageRoute(builder: (context) =>RegisterQR(code: url)));  
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterQR(code: url,usuario: widget.usuario,)));
                      //Navigator.of(context).pop();
                    }
                  ),
                  QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.9)),  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}