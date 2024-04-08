import 'package:casa/screens/generals/icons.dart';
import 'package:casa/screens/generals/login.dart';
import 'package:casa/screens/generals/settings.dart';
import 'package:casa/screens/user/mobile/codigoQR.dart';
import 'package:casa/screens/user/desktop/home.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  Jugadores usuario;
  DesktopScaffold({super.key,required this.usuario});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  var selectedPage = 0;
  static const int caseCerrarSesion = 4;
  TextStyle LabelStyle = TextStyle(fontWeight: FontWeight.w400);
  Color destinationIcon = Color.fromARGB(255, 33, 122, 112);
  Color destinationIconSelected = Colors.black;
  @override
  Widget build (BuildContext context){
    Widget page = Placeholder();

    switch (selectedPage){
      case 0: //HOME
        page = Home();
        break;
      case 1://MI PROGRESO
        page= Placeholder();
        break;
      case 2://QR
        page = myQR(usuario: widget.usuario,);
        break;
      case 3://PREFERENCIAS
        page= Settings(usuario: widget.usuario,);
        break;
      case caseCerrarSesion://CERRAR SESION
        //page = Login();
        break;
      default:
        throw UnimplementedError('no widget for $selectedPage');
    }

    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: 
                NavigationRail (
                  labelType: NavigationRailLabelType.all,
                  //extended: constraints.maxWidth >= 1200,
                  //minWidth: 70,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(iconHome,color:destinationIcon),
                      selectedIcon: Icon(iconHome,color:destinationIconSelected),
                      label: Text('Inicio',style: LabelStyle),
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconBolt,color:destinationIcon), 
                      selectedIcon: Icon(iconBolt,color:destinationIconSelected),
                      label: Text('Mi progreso',style: LabelStyle),
                    ),
                    
                    NavigationRailDestination(
                      icon: Icon(iconScanQR,color:destinationIcon), 
                      selectedIcon: Icon(iconScanQR,color:destinationIconSelected),
                      label: Text('Mi QR',style: LabelStyle),
                      disabled: false,  // administrar permisos de mods
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconSettings,color:destinationIcon),
                      selectedIcon: Icon(iconSettings,color:destinationIconSelected), 
                      label: Text('Preferencias',style: LabelStyle),
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconSalir,color:destinationIcon), 
                      selectedIcon: Icon(iconSalir,color:destinationIconSelected), 
                      label: Text('Cerrar Sesión',style: LabelStyle),
                    ),
                  ],
                  selectedIndex: selectedPage,
                  onDestinationSelected: (value) {
                    setState(() {
                      var anterior = selectedPage;
                      selectedPage = value;
                      if (value==caseCerrarSesion){
                        selectedPage=anterior;
                        showDialog(context: context, 
                          builder: (_)=> AlertDialog(
                            title: const Text('Cerrar Sesión'),
                            content: const Text('¿Está seguro que desea cerrar la sesión?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context, 'Cancel');
                                  setState(() {
                                    selectedPage = anterior;
                                  });
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
                      }
                    });
                  },                  
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 230,204,179),
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}