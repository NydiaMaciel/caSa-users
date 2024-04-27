import 'package:casa/screens/user/rp/evento.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:casa/screens/generals/icons.dart';
import 'package:casa/screens/user/mobile/tienda.dart';
import 'package:casa/screens/user/rp/timelinetileClass.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Jugadores usuario;
  const Home({super.key,required this.usuario});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  late int puntosGlobal;
  late int indexInsig;
  Evento evento = Evento();

  @override
  void initState(){
    super.initState();
    puntosGlobal = widget.usuario.totalClientsReferred;
    indexInsig = getInsig(puntosGlobal);
  }

  int getInsig(p){
    int index=0;
    if(p==0) return 0;

    for (var i in evento.insigPTS){
      if(p<i){
        return index-1;
      }
      index++;
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    double done = getDone();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //supp
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              color: Color.fromARGB(100, 131, 117, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right:7,left: 15),
                    height: 40,
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(puntosGlobal.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Hello",
                            fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5,),
                        Icon(iconCoins,size: 20,color: Colors.amber[600]),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.0,
                        color: Color.fromARGB(255, 84, 71, 80),
                      ),
                    ),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 50,
                    elevation: 0,
                    color: Colors.white,
                    textColor: Color.fromARGB(255, 154, 59, 91),
                    child: Icon(iconStore),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 1.0, style: BorderStyle.solid, color:Color.fromARGB(255, 84, 71, 80))
                    ),
                    
                    onPressed: (){
                      setState(() {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Tienda()));
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Container(//linetime
                  height: MediaQuery.of(context).size.height*0.9,
                  width: 500,
                  child: 
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      //height: altoContainer,
                      color: Color.fromARGB(40, 131, 117, 24),
                      child: ListView.builder(
                        itemCount: evento.titulo.length,
                        itemBuilder:(context, index) {
                          return MyTimeLineTile(
                            titleEvent: evento.titulo[index],
                            descriptionEvent: evento.descrip[index],
                            pointsEvent: evento.bolet[index],
                            isFirst: index==0? true:false,
                            isLast:index==evento.titulo.length-1? true:false,
                            isPast: puntosGlobal> evento.bolet[index]? true:false,
                            img: evento.imgs[index],
                          );
                        },
                        controller: ScrollController(
                          initialScrollOffset: done*130.0,
                          keepScrollOffset: false,
                        ),
                      ),
                    ),
                  ),
                ),
                //bott
                Container(
                  padding: EdgeInsets.all(7),
                  height: MediaQuery.of(context).size.height*0.47,
                  width: MediaQuery.of(context).size.width*0.2,
                  color:Color.fromARGB(100, 131, 117, 24),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width*0.15,
                        height: MediaQuery.of(context).size.width*0.15,
                        decoration:const BoxDecoration(
                        ),
                      child:Image.asset(
                        evento.insigIMG[indexInsig], // URL de la imagen
                        fit: BoxFit.cover,), 
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: MediaQuery.of(context).size.height*0.13,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width*0.2,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(20, 225, 172, 15),
                                    Color.fromARGB(200, 225, 172, 15),
                                    Color.fromARGB(255, 203, 156, 14),
                                    Color.fromARGB(200, 225, 172, 15),
                                    Color.fromARGB(20, 225, 172, 15),
                                  ],
                                ),
                              ),
                              child: Text(evento.insigSTR[indexInsig],style: TextStyle(
                                fontFamily: 'Hello',
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[800],
                              ),),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                height: 50,
                                child: Text('Felicidades, sigue participando para que sigas ganando premios increíbles!!',
                                  style: TextStyle(fontSize: 17, fontFamily: 'Hello',fontWeight: FontWeight.w600,color: Colors.brown[900],),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getDone(){
    double done_ = 0.0;
    for (var index in evento.bolet){
      if(puntosGlobal/index>1.0){
        done_=done_+1.0;
      }else{
        return done_;
      }
    }
    return done_;
  }
}

