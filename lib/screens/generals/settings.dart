import 'package:casa/screens/generals/icons.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Settings extends StatefulWidget {
  Jugadores usuario;
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
  
  
  @override
  Widget build(BuildContext context) {
    double MQwidth = MediaQuery.of(context).size.width;
    bool responsive_ = MQwidth<1100? true:false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Theme(
              data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: Icon(iconUsuario),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                tilePadding: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
                childrenPadding: EdgeInsets.only(top: 3, bottom: 20, right: 30, left: 30),
                title: const Text('Cuenta', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
                children: [
                  ListTile(
                    title: const Text('Nombre de Usuario', style: TextStyle(fontWeight: FontWeight.w600,)),
                    subtitle: Text(widget.usuario.userName,style: TextStyle(fontSize: 17),),
                  ),
                  ListTile(
                    title: const Text('Correo electrónico', style: TextStyle(fontWeight: FontWeight.w600,)),
                    subtitle: Text(widget.usuario.email,style: TextStyle(fontSize: 17),),
                  ),
                  const SizedBox(height: 20,),
                  const Divider(),
                  Theme(
                    data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: const Text('Cambiar nombre de usuario', style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Row(
                          children: [ 
                            Container(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Nuevo: ',style: TextStyle(fontSize: 17),)),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.5:0.25),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nwusr1,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [ 
                            Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Confirmar: ',style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.5:0.25),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nwusr2,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: FilledButton(
                            child: Text('Guardar cambios', style: TextStyle(fontSize: 17,),),
                            onPressed: (){
                              if(ctrl_nwusr1.text=='' && ctrl_nwusr2.text=='' ){
                              }else if (ctrl_nwusr1.text!=ctrl_nwusr2.text){
                                setState(() {
                                  noCoincidence();
                                  
                                });
                              }else{
                                ctrl_nwusr1.text='';
                                ctrl_nwusr2.text='';
                                changesSaved();
                              }
                            }, 
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Theme(
              data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: Icon(Icons.shield),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                tilePadding: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
                childrenPadding: EdgeInsets.all(10),
                title: Text('Seguridad', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
                children: [
                  Theme(
                    data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
              
                      title: const Text('Cambiar contraseña', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      )),
                      children: [
                        Row(
                          children: [ 
                            Container(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Nuevo: ', style: TextStyle(fontSize: 17),)),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.5:0.25),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nwpwd1,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [ 
                            Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Confirmar: ',style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.5:0.25),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nwpwd2,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.bottomRight,
                          child: FilledButton(
                            child: Text('Guardar cambios', style: TextStyle(fontSize: 17,),),
                            onPressed: (){
                              if(ctrl_nwpwd1.text=='' && ctrl_nwpwd2.text=='' ){
                              }else if (ctrl_nwpwd1.text!=ctrl_nwpwd2.text){
                                noCoincidence();
                              }else{
                                ctrl_nwpwd1.text='';
                                ctrl_nwpwd2.text='';
                                changesSaved();
                              }
                            }, 
                          ),
                        ),
                      ],
                    ),
                  ),
                  Theme(
                    data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: const Text('Cambiar correo electrónico', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      )),
                      children: [
                        Row(
                          children: [ 
                            Container(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Nuevo: ',style: TextStyle(fontSize: 17),)),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.6:0.3),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nweml1,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [ 
                            Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*(responsive_?0.20:0.25),
                              child: Text('Confirmar: ',style: TextStyle(fontSize: 17),)
                            ),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width*(responsive_?0.6:0.3),
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                controller: ctrl_nweml2,
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  labelStyle: TextStyle(fontSize: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.bottomRight,
                          child: FilledButton(
                            child: Text('Guardar cambios', style: TextStyle(fontSize: 17,),),
                            onPressed: (){
                              if(ctrl_nweml1.text=='' && ctrl_nweml2.text=='' ){
                              }else if (ctrl_nweml1.text!=ctrl_nweml2.text){
                                noCoincidence();
                              }else{
                                ctrl_nweml1.text='';
                                ctrl_nweml2.text='';
                                changesSaved();
                              }
                            }, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
            Divider(),
          ],
        ),
      )
    );
  }

  void changesSaved(){
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text('Datos guardados',style: TextStyle(fontSize: 18),),
      description: Text('Los datos fueron guardados satisfactoriamente.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      showProgressBar: false,
    );
  }

  void noCoincidence(){
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      showProgressBar: false,
      title: Text('Fallo de confirmación ',style: TextStyle(fontSize: 18),),
      description: Text('Los campos no coinciden, ¡vuelva a escribirlos por favor!',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
    );
  }

}