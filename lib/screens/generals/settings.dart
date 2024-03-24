import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  String usuario;
  Settings({super.key, required this.usuario});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double MQwidth = MediaQuery.of(context).size.width;
    bool responsive = MQwidth<1100? true:false;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 5,top:5),
                      alignment: Alignment.centerLeft,
                      child: Text('  Cambiar contraseña',textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container(
                      width: responsive?MQwidth-160:MQwidth-260,
                      margin: EdgeInsets.only(left:5,right: 0,top:15,bottom: 5),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide.none, right: BorderSide.none,
                        top: BorderSide(width: 1, color: Color.fromARGB(255, 153, 153, 153),style: BorderStyle.solid),
                        bottom: BorderSide(width: 0.8, color:  Color.fromARGB(255, 51, 51, 51),style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('  Nueva contraseña:',),
                Text('  Confirme la nueva contraseña:'),
                Text('  [ Cambiar ] [ Cancelar ]')
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 5,top:5),
                      alignment: Alignment.centerLeft,
                      child: Text('  Cambiar correo electrónico',textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container( //responsive?MQwidth-160:MQwidth-260,
                      width: responsive?MQwidth-200:MQwidth-300,
                      margin: EdgeInsets.only(left:5,right: 0,top:15,bottom: 5),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide.none, right: BorderSide.none,
                        top: BorderSide(width: 1, color: Color.fromARGB(255, 153, 153, 153),style: BorderStyle.solid),
                        bottom: BorderSide(width: 0.8, color:  Color.fromARGB(255, 51, 51, 51),style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('  Ingrese la nueva contraseña:',),
                Text('  Confirme la nueva contraseña:'),
                Text('  [ Cambiar ] [ Cancelar ]')
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}