import 'package:casa/screens/user/rp/evento.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:casa/screens/generals/icons.dart';
import 'package:casa/screens/user/mobile/tienda.dart';
import 'package:casa/screens/user/rp/timelinetileClass.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Jugadores usuario;
  Home({super.key,required this.usuario});

  @override
  State<Home> createState() => _HomeState();
}
late int puntosGlobal;


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
        //color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //supp
            Container(
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: Color.fromARGB(100, 131, 117, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(right:7,left: 15),
                    height: 50,
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(puntosGlobal.toString(),
                          style: const TextStyle(
                            fontSize: 20,
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
                    height: 55,
                    minWidth: 60,
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
            //linetime
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
            //bott
            Container(
              padding: EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height*0.17,
              color:Color.fromARGB(100, 131, 117, 24),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.width*0.25,
                    decoration:const BoxDecoration(
                    ),
                  child:Image.asset(
                    evento.insigIMG[indexInsig], // URL de la imagen
                    fit: BoxFit.cover,), 
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.60,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*0.9,
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
                          child: Column(
                            children: [
                              Text('Felicidades, sigue participando para que sigas ganando premios increíbles!!',
                                style: TextStyle(fontSize: 17, fontFamily: 'Hello',fontWeight: FontWeight.w600,color: Colors.brown[900],),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
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