import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class myQR extends StatelessWidget {
  Jugadores usuario;
  myQR({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mi código QR:', style: TextStyle(fontSize: 25),),
            SizedBox(height: 50,),
            Container(
              child: RepaintBoundary(
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
}