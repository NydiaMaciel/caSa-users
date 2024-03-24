import 'package:demo_casa_3/screens/users/rp/eventCard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String titleEvent;
  final String descriptionEvent;
  final int pointsEvent;

  MyTimeLineTile({
    super.key, 
    required this.titleEvent, 
    required this.descriptionEvent, 
    required this.pointsEvent, 
    required this.isFirst, 
    required this.isLast,
    required this.isPast, 
  });

  const MyTimeLineTile.sinfirst({
    super.key,
    required this.titleEvent, 
    required this.descriptionEvent, 
    required this.pointsEvent,
    required this.isLast,

    required this.isPast,
  }):isFirst=false;
  
  const MyTimeLineTile.sinlast({
    super.key,
    required this.titleEvent, 
    required this.descriptionEvent, 
    required this.pointsEvent,
    required this.isFirst,

    required this.isPast,
  }):isLast=false;
  //MyTimeLineTile.origin(): isFirst=first, isLast=last;

  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width>1100?true:false;
    return Container(
      height: responsive?150:200, //espacio entre eventos
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          thickness: 6.5,
          color: isPast? Color.fromARGB(255, 145, 98, 151): Color.fromARGB(255, 190, 165, 194),
        ),
        indicatorStyle: IndicatorStyle(
          width: 25,
          color: isPast? Color.fromARGB(255, 145, 98, 151): Color.fromARGB(255, 190, 165, 194),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast? Colors.white: Color.fromARGB(255, 190, 165, 194), fontSize: 20,
          ),
        ),
        endChild: EventCard(titleEvent_: titleEvent, descriptionEvent_: descriptionEvent, pointsEvent_:pointsEvent, past: isPast,),
      ),
    );
  }
}