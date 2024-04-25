import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';


import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';


class myQR extends StatelessWidget {
  Jugadores usuario;
  myQR({super.key, required this.usuario});
  String path_img='..\..\..\..\images\qr_img.png';

  @override
  Widget build(BuildContext context) {
    Key renderObjectKey = Key('ImageQrCode');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getWidgetImage();
          //Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg'])4;
          Share.shareXFiles(
            [XFile(path_img)],
            text: "My código QR - La Casa Invita"
          );
        },
        child: Icon(Icons.share,color: Colors.white,),
        backgroundColor: fucsia,
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
  
  void getWidgetImage() async {
    try {
      final imagen = await QrPainter(
        data: usuario.id.toString(), 
        version: QrVersions.auto
      ).toImage(500); 
      
    var byteData = await imagen.toByteData(format: ImageByteFormat.png);
    Uint8List  pngBytes = byteData!.buffer.asUint8List();
    File file = File(path_img);
    file.writeAsBytesSync(pngBytes);
  } catch (e) {
    throw e;
  }
  }
}