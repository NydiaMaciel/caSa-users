import 'package:casa/screens/user/rp/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class MyTimeLineTile extends StatelessWidget {
  String titleEvent;
  String descriptionEvent;
  int pointsEvent;
  String img;
  bool isFirst;
  bool isLast;
  bool isPast;

  MyTimeLineTile({
    super.key, 
    required this.titleEvent, 
    required this.descriptionEvent, 
    required this.pointsEvent, 
    this.isFirst = false,
    this.isLast = false,
    this.isPast = false,
    this.img = 'images/no_image2.png'
  });

  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width>1100?true:false;
    return Container(
      height: 150, //espacio entre eventos
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          thickness: 6.5,
          color: isPast? Color.fromARGB(255, 174, 157, 87): Color.fromARGB(255, 179, 173, 145),
        ),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color: isPast? Color.fromARGB(255, 218, 175, 0): Color.fromARGB(255, 179, 173, 145),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast? Color.fromARGB(255, 66, 52, 0): Color.fromARGB(255, 179, 173, 145), 
            fontSize: 22,
          ),
        ),
        endChild: EventCard(titleEvent_: titleEvent, descriptionEvent_: descriptionEvent, pointsEvent_:pointsEvent, past: isPast,img: img,),
      ),
    );
  }
}