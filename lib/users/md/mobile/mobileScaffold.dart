import 'package:demo_casa_3/generals/icons.dart';
import 'package:demo_casa_3/generals/login.dart';
import 'package:demo_casa_3/generals/settings.dart';
import 'package:demo_casa_3/users/md/mobile/productos.dart';
import 'package:demo_casa_3/users/md/mobile/modsMobile.dart';
import 'package:demo_casa_3/users/md/mobile/rpsMobile.dart';
import 'package:demo_casa_3/users/md/scanner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demo_casa_3/users/md/homeMD.dart';

late Widget bodyPage;
String tituloAppBar = ""; 
Color hoverDrawerItem = Color.fromARGB(152, 209, 176, 207);

class mobileScaffold extends StatefulWidget {
  String usuario;
  int pag;
  mobileScaffold({super.key, required this.usuario, required this.pag});

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  late Widget bodyPage; 
  
  @override
  Widget build(BuildContext context) {
  
    switch(widget.pag){
      case 0:
        bodyPage=HomeMD();
        break;
      case 1:
        bodyPage=Scanner(usuario: widget.usuario);
        break;
      case 2:
        bodyPage=ModsMobile();
        break;
      case 3:
        bodyPage=RpsMobile();
        break;
      case 4:
        bodyPage=ProductosTab();
        break;
      case 5:
        bodyPage=Settings(usuario: widget.usuario,);
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text(tituloAppBar),backgroundColor: const Color.fromARGB(0, 82, 198, 188),),
      backgroundColor: Color.fromARGB(255, 131, 174, 177),
      drawer: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: Drawer(    
          width: 250,
          backgroundColor: Color.fromARGB(255,143,216,196),
          
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
                    widget.pag=0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconScanQR),
                title: const Text('Escanear QR'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Escanear QR";
                    widget.pag=1;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconMods),
                title: const Text('Moderadores'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Moderadores";
                    widget.pag=2;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconJugadores),
                title: const Text('Jugadores'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Jugadores";
                    widget.pag=3;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(iconProducts),
                title: const Text('Productos'),
                hoverColor: hoverDrawerItem,
                onTap: () {
                  setState(() {
                    tituloAppBar="Productos";
                    widget.pag=4;
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
                    widget.pag=5;
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