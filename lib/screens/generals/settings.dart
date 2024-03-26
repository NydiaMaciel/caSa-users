import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  String usuario;
  Settings({super.key, required this.usuario});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
TextEditingController ctrl_nweml1 = new TextEditingController();
TextEditingController ctrl_nweml2 = new TextEditingController();
TextEditingController ctrl_nwpwd1 = new TextEditingController();
TextEditingController ctrl_nwpwd2 = new TextEditingController();
TextEditingController ctrl_nwusr1 = new TextEditingController();
TextEditingController ctrl_nwusr2 = new TextEditingController();
bool eusr = false;
bool epwd = false;
bool eeml = false;
  
  @override
  Widget build(BuildContext context) {
    const Color luz = Color.fromARGB(255, 154, 154, 137);
    const Color sombra = Color.fromARGB(255, 163, 163, 163);
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
                      child: Text('  Cambiar nombre de usuario',textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: responsive? 16:15,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container( //responsive?MQwidth-160:MQwidth-260,
                      width: responsive?MQwidth-240:MQwidth-330,
                      margin: EdgeInsets.only(left:5,right: 0,top:15,bottom: 0),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide.none, right: BorderSide.none,
                        top: BorderSide(width: 1, color: luz,style: BorderStyle.solid),
                        bottom: BorderSide(width: 0.8, color:  sombra,style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Nuevo nombre de usuario:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.45:0.25),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nwusr1,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Confirme nombre de usuario:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.45:0.25),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nwusr2,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      eusr? Text('No coinciden!', style: TextStyle(color: Colors.red),):SizedBox(width: 0,),
                      SizedBox(width: 20,),
                      FilledButton.tonal(
                          child: Text('Guardar'),
                          onPressed: (){
                            setState(() {
                              if(ctrl_nwusr1.text==ctrl_nwusr2.text){
                                ctrl_nwusr1.text="";
                                ctrl_nwusr2.text="";
                                eusr=false;
                              }else{
                                eusr=true;
                              }
                            });
                          }, 
                        ),
                    ],
                  ),
                ),
              ],
            ),
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
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
                        fontSize: responsive? 16:15,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container(
                      width: responsive?MQwidth-190:MQwidth-270,
                      margin: EdgeInsets.only(left:5,right: 0,top:15,bottom: 0),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide.none, right: BorderSide.none,
                        top: BorderSide(width: 1, color: luz,style: BorderStyle.solid),
                        bottom: BorderSide(width: 0.8, color:  sombra ,style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Nueva contraseña:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.45:0.25),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nwpwd1,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Confirme contraseña:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.45:0.25),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nwpwd2,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      epwd? Text('No coinciden!', style: TextStyle(color: Colors.red),):SizedBox(width: 0,),
                      SizedBox(width: 20,),
                      FilledButton.tonal(
                          child: Text('Guardar'),
                          onPressed: (){
                            setState(() {
                              if(ctrl_nwpwd1.text==ctrl_nwpwd2.text){
                                ctrl_nwpwd1.text="";
                                ctrl_nwpwd2.text="";
                                epwd=false;
                              }else{
                                epwd=true;
                              }
                            });
                          }, 
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                        fontSize: responsive? 16:15,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container( //responsive?MQwidth-160:MQwidth-260,
                      width: responsive?MQwidth-240:MQwidth-320,
                      margin: EdgeInsets.only(left:5,right: 0,top:15,bottom: 0),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide.none, right: BorderSide.none,
                        top: BorderSide(width: 1, color: luz,style: BorderStyle.solid),
                        bottom: BorderSide(width: 0.8, color:  sombra,style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Nuevo correo:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.70:0.45),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nweml1,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('  Confirme correo:',),
                    Container(
                      height: responsive? 40:35,
                      width: MediaQuery.of(context).size.width*(responsive?0.70:0.45),
                      margin: EdgeInsets.all(5),
                      child: TextField(
                        controller: ctrl_nweml2,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelStyle: TextStyle(fontSize: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      eeml? Text('No coinciden!', style: TextStyle(color: Colors.red),):SizedBox(width: 0,),
                      SizedBox(width: 20,),
                      FilledButton.tonal(
                          child: Text('Guardar'),
                          onPressed: (){
                            setState(() {
                              if(ctrl_nweml1.text==ctrl_nweml2.text){
                                ctrl_nweml1.text="";
                                ctrl_nweml2.text="";
                                eeml=false;
                              }else{
                                eeml=true;
                              }
                            });
                          }, 
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],//opciones
        ),
      ),
    );
  }
}