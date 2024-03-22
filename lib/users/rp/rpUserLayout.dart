import 'package:flutter/material.dart';

class RpUserLayout extends StatelessWidget {
  //const RpUserLayout({super.key});
  final Widget mobileScaffold;
  //final Widget tabletScaffold;
  final Widget desktopScaffold;

  RpUserLayout({
    required this.mobileScaffold,
    //required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<1100){
        return mobileScaffold;
      //}else if(constraints.maxWidth<1100){
        //return tabletScaffold;
      }else{
        return desktopScaffold;
      }
    });
  }
}