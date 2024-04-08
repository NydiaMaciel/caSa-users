import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String titleEvent_ ;
  final String descriptionEvent_;
  final int pointsEvent_;
  final bool past;
  const EventCard({super.key, required this.titleEvent_, required this.descriptionEvent_, required this.pointsEvent_,required this.past});

  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width>1100?true:false;
    double Mdwidth= MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      height: 120,
      decoration: BoxDecoration(
        color: past? Color.fromARGB(255, 145, 98, 151): Color.fromARGB(255, 190, 165, 194),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: responsive?Mdwidth*0.20:Mdwidth*0.60,
            child: Column(
              children: [
                Text(titleEvent_,style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(descriptionEvent_,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(width: 10,),
          Container(
            width: responsive?Mdwidth*0.07:Mdwidth*0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$pointsEvent_',style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('boletos',style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}