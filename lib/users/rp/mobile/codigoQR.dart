import 'package:flutter/material.dart';

class myQR extends StatelessWidget {
  const myQR({super.key});

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
              height: 300,//mobile:desktop,
              width: 300,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage('images/codigoQR.jpeg'),
                ),
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}