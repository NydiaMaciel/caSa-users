import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:casa/screens/generals/icons.dart';
import 'package:casa/screens/user/mobile/tienda.dart';
import 'package:casa/screens/user/rp/timelinetileClass.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int puntosGlobal=7500;
List<int> metas = [111,222,333,444,555,666,777,888,999,2500,5000,10000,25000,50000,75000,150000];
List<int> bolet = [111,111,111,111,111,111,111,111,111,250,333,500,1000,1000,1000,1000];
List<String> descrip = [
  'Primera gran rifa el 30 de enero',
  'Segunda rifa 5 de febrero',
  'Rifa del día 12 de febrero',
  'Rifa 15 de febrero',
  'Rifa 18 de febrero',
  'Rifa 25 de febrero',
  'Rifa 10 de marzo',
  'Rifa 22 de marzo',
  'Rifa 30 sde marzo',
  'Rifa xx de Abril',
  'Rifa xx de Abril',
  'Rifa xx de Abril',
  'Rifa xx de Mayo',
  'Rifa xx de Mayo',
  'Rifa xx de Mayo',
  'Rifa xx de Junio'];

  double getDone(){
    double done_ = 0.0;
    for (var index in metas){
      if(puntosGlobal/index>1.0){
        done_=done_+1.0;
      }else{
        print('done: '+done_.toString());
        return done_;
      }
    }
    print('done: '+done_.toString());
    return done_;
  }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double done = getDone();
    double altoContainer = MediaQuery.of(context).size.height*0.60;
    double alto = 120;
    double margen = 15;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 51, 184, 184),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(right:7,left: 15),
                    height: 50,
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(puntosGlobal.toString(),style: const TextStyle(fontSize: 20,fontFamily: "Hello",fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Icon(iconCoins,size: 20,color: Colors.amber[600]),
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
                  
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5,
                        color: Color.fromARGB(255, 100, 2, 66),
                      ),
                    ),
                    margin: EdgeInsets.all(15),
                    child: GFButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Tienda()));
                      },
                      text: "",
                      textStyle: TextStyle(fontSize: 1),
                      icon: Icon(Icons.store,color: Color.fromARGB(255, 154, 59, 91), size: 35,),
                      type: GFButtonType.transparent,
                      borderShape: CircleBorder(side: BorderSide(width: 0.5)),
                    ),

                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: MediaQuery.of(context).size.height*0.83,
                    width: 500,
                    color: Color.fromARGB(45, 101, 25, 145),
                    child: ListView.builder(
                      itemCount: metas.length,
                      itemBuilder:(context, index) {
                        return MyTimeLineTile(
                          titleEvent: metas[index].toString(),
                          descriptionEvent: descrip[index],
                          pointsEvent: bolet[index],
                          isFirst: index==0? true:false,
                          isLast:index==metas.length-1? true:false,
                          isPast: puntosGlobal>metas[index]? true:false,
                        );
                      },
                      controller: ScrollController(
                        initialScrollOffset: (done-1)*150,
                        keepScrollOffset: false,
                      ),
                    ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.all(20),
                    //height: MediaQuery.of(context).size.height*0.57,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(50, 25, 145, 125),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration:const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:AssetImage('images/insignias/capture5.png'),
                          ),
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width*0.8,
                                alignment: Alignment.center,
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
                                child: Text('Anauyaca',style: TextStyle(
                                  fontFamily: 'Hello',
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 71, 3, 47),
                                ),),
                              ),
                              SizedBox(height: 20,),
                              Text('Felicidades, ahora eres miembro Anauyaca! \n Sigue participando para que sigas ganando premios increíbles!!',
                                  style: TextStyle(fontSize: 18, fontFamily: 'Hello',fontWeight: FontWeight.w600,color: Color.fromARGB(255, 71, 3, 47)),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),
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
}

