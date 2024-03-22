import 'dart:ffi';
import 'package:demo_casa_3/generals/icons.dart';
import 'package:flutter/material.dart';

class Tienda extends StatefulWidget {
  const Tienda({super.key});

  @override
  State<Tienda> createState() => _TiendaState();
}

int puntos=15;
final TextEditingController ctrl_coins = new TextEditingController();

class _TiendaState extends State<Tienda> {
  List<String>imagenes=[
    'images/premios/regalo_2.png',
    'images/premios/regalo_3.png',
    'images/premios/regalo_4.png',
  ];
  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width>1100?true:false;
    setState(() {
      ctrl_coins.text=puntos.toString();
    });
    return Scaffold(
      appBar: AppBar(title: Text('Tienda'),backgroundColor: Color.fromARGB(185, 60, 145, 138),),
      body: Container(
        color: const Color.fromARGB(132, 255, 236, 179),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //head
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(182, 224, 72, 181),
              child: Row(
                children: [
//                        suffixIcon: Icon(iconCoins,size: 20,color: const Color.fromARGB(255, 46, 147, 231)/*amber[600]*/,),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(right:7,left: 15),
                    height: 50,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(puntos.toString(),style: const TextStyle(fontSize: 25,fontFamily: "Hello",fontWeight: FontWeight.bold),),
                        SizedBox(width: 15,),
                        Icon(iconCoins,size: 24,color: Color.fromARGB(255, 83, 171, 243)),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5,
                        color: Color.fromARGB(255, 100, 2, 66),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('Canjea puntos por premios!',style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quick',
                    color: Color.fromARGB(255, 255, 191, 0),
                  ),),
                ],
              ),
            ),
            //cards 
            Container(
              padding: EdgeInsets.all(responsive?20:5),
              height: MediaQuery.of(context).size.height*0.83,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: responsive?7:2,
                
                ),
                scrollDirection: Axis.vertical,
                children: List.generate(20, (index) {
                  return Container(
                    padding: EdgeInsets.only(left:5,right:5),
                    margin: EdgeInsets.all(responsive?20:10),
                    height: 500,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(156, 255, 232, 165),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.5,color: Color.fromARGB(255, 100, 2, 66)),
                    ),
                    child:Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:AssetImage(imagenes[index%imagenes.length]),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/2*0.8,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(10, 248, 202, 175),
                                      Color.fromARGB(200, 248, 202, 175),
                                      Color.fromARGB(255, 248, 202, 175),
                                      Color.fromARGB(200, 248, 202, 175),
                                      Color.fromARGB(10, 248, 202, 175),
                                    ],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text('Premio $index',style: TextStyle(
                                  fontFamily: 'Hello',
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 71, 3, 47),
                                ),),
                              ),
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width/2*0.6,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 225, 208),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1.5,
                                    color: Color.fromARGB(255, 100, 2, 66),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('123',style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: 'Hello',
                                      color: Color.fromARGB(255, 100, 2, 66),
                                      fontWeight: FontWeight.bold,
                                    )),
                                    SizedBox(width: 20,),
                                    Icon(iconCoins,size: 25,color: Color.fromARGB(255, 83, 171, 243)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}