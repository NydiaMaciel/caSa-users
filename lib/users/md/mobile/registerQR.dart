import 'package:demo_casa_3/users/md/mobile/mobileScaffold.dart';
import 'package:demo_casa_3/users/md/scanner.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class RegisterQR extends StatefulWidget {
  final String code;
  const RegisterQR({required this.code});

  @override
  State<RegisterQR> createState() => _RegisterQRState();
}

class _RegisterQRState extends State<RegisterQR> {
  int cont=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 226, 202, 210),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(widget.code, style: TextStyle(fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    color: cont>0?Color.fromARGB(255, 134, 164, 209):Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                      ),
                  ),
                  child: GFButton(
                    onPressed: (){
                      setState(() {
                        if (cont>0){
                          cont=cont-1;
                        }
                      });
                    },
                    icon: Icon(Icons.remove,size: 20,),
                    text: '',
                    type: GFButtonType.transparent,
                  ),
                ),
                Container(
                  height: 70,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(cont.toString(),style: TextStyle(fontSize: 25),),
                ),
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 134, 164, 209),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                      ),
                  ),
                  child: GFButton(
                    onPressed: (){
                      setState(() {
                          cont=cont+1;
                      });
                    },
                    icon: Icon(Icons.add,size: 20,),
                    text: '',
                    type: GFButtonType.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:cont>0? Color.fromARGB(255,237,39,136):Colors.grey,
                padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0), 
              ),
              
              onPressed: () {  
                if (cont>0){
                  setState(() {
                    tituloAppBar='';
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>mobileScaffold()));
                }
              },  
              child: const Text('Registrar', style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}