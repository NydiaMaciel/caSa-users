import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  String titleEvent_ ;
  String descriptionEvent_;
  int pointsEvent_;
  String img;
  bool past;
  
  EventCard({super.key, 
    required this.titleEvent_, 
    required this.descriptionEvent_, 
    required this.pointsEvent_,
    required this.img,
    required this.past,
  });

  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width>1100?true:false;
    double Mdwidth= MediaQuery.of(context).size.width;
    double MdHeight= MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(15),
      
      decoration: BoxDecoration(
        color: past? Color.fromARGB(255, 112, 171, 167): Color.fromARGB(219, 165, 194, 192),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(titleEvent_,style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      color: Color.fromARGB(255, 34, 53, 48),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 87,
                      width: 200,
                      padding: EdgeInsets.only(left: 10, top: 0,right: 5),
                      child: Text(descriptionEvent_,
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                       
                    ),
                    //SizedBox(width: 6,),
                    Flexible(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('$pointsEvent_',style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 34, 53, 48),
                              ),
                            ),
                            Text('puntos',style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 34, 53, 48),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                
              ],
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(image: AssetImage(img)),
            ), 
          ),
          
        ],
      ),
    );
  }
}