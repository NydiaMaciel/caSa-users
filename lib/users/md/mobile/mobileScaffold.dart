import 'package:demo_casa_3/generals/icons.dart';
import 'package:demo_casa_3/generals/login.dart';
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
  const mobileScaffold({super.key});

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  Widget bodyPage = HomeMD(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tituloAppBar),backgroundColor: const Color.fromARGB(0, 82, 198, 188),),
      backgroundColor: Color.fromARGB(255, 131, 174, 177),
      drawer: Drawer(    
        width: 250,
        backgroundColor: Color.fromARGB(255, 255, 212, 253),
        shape: const Border(
          bottom: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide.none,
          top: BorderSide.none,
        ),
        child: Column(
          children: [
            const SizedBox(
              width: 240,
              height: 150,
              child:  DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                leading:Icon(FontAwesomeIcons.userLarge),
                title: Text('Usuario'),
                textColor: Colors.deepPurple,
                iconColor: Colors.deepPurple,
              ),
            ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              hoverColor: hoverDrawerItem,
              onTap: () {
                setState(() {
                  tituloAppBar="";
                  bodyPage = HomeMD();
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
                  bodyPage= Scanner();
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
                  bodyPage=ModsMobile();
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
                  bodyPage=RpsMobile();
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
                  bodyPage=Placeholder();
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
                  bodyPage=Placeholder();
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
      body: bodyPage,
    );
  }
}