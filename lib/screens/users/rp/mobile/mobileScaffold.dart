import 'package:demo_casa_3/screens/generals/settings.dart';
import 'package:demo_casa_3/screens/users/rp/mobile/codigoQR.dart';
import 'package:demo_casa_3/screens/users/rp/mobile/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:demo_casa_3/screens/generals/icons.dart';
import 'package:demo_casa_3/screens/generals/login.dart';

late Widget bodyPage;
String tituloAppBar = ""; 
Color hoverDrawerItem = Color.fromARGB(152, 209, 176, 207);

class mobileScaffold extends StatefulWidget {
  String usuario;
  mobileScaffold({super.key, required this.usuario});

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  Widget bodyPage = Home();
  @override
  Widget build(BuildContext context) {
    bool responsive = MediaQuery.of(context).size.width<1100? true:false;
    return Scaffold(
      appBar: AppBar(title: Text(tituloAppBar),backgroundColor: const Color.fromARGB(0, 82, 198, 188),),
      backgroundColor: Color.fromARGB(255,143,216,196),
      drawer: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: Drawer(    
          width: 250,
          backgroundColor: Color.fromARGB(255, 169, 211, 200),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                      leading:Icon(FontAwesomeIcons.userLarge),
                      title: Text(widget.usuario, style: TextStyle(
                        fontSize: 18,
                      ),),
                      textColor: Color.fromARGB(255, 86, 126, 115),
                      iconColor: Color.fromARGB(255, 86, 126, 115),
                      subtitle: Text('usuario@exemple.com',style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="";
                    bodyPage = Home();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconBolt),
                title: const Text('Mi Progreso'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Mi Progreso";
                    bodyPage=Placeholder();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconScanQR),
                title: const Text('mi QR'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Código QR";
                    bodyPage= myQR();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconSettings),
                title: const Text('Preferencias'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Preferencias";
                    bodyPage=Settings(usuario: widget.usuario,);
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading:Icon(iconSalir),
                title: const Text('Salir'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    showDialog(context: context, 
                      builder: (_)=> AlertDialog(
                        title: const Text('Cerrar Sesión'),
                        content: const Text('¿Está seguro que desea cerrar la sesión?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context, 'Cancel');
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context, 'OK');
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                            },
                            child: const Text('Si'),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: bodyPage,
    );
  }
}