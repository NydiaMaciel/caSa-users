import 'package:demo_casa_3/icons.dart';
import 'package:demo_casa_3/login.dart';
import 'package:demo_casa_3/users/md/homeMD.dart';
import 'package:demo_casa_3/users/md/desktop/mods.dart';
import 'package:demo_casa_3/users/md/scanQR.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  var selectedPage = 0;
  static const int caseCerrarSesion = 6;
  TextStyle LabelStyle = TextStyle(fontWeight: FontWeight.w400);
  Color destinationIcon = Color.fromARGB(255, 33, 122, 112);
  Color destinationIconSelected = Colors.black;
  @override
  Widget build (BuildContext context){    
    Widget page = Placeholder();

    switch (selectedPage){
      case 0: //HOME
        page = HomeMD();
        break;
      case 1://Scan QR
        page= ScanQR();
        break;
      case 2://MODS
        page = ModeradoresMD();
        break;
      case 3://JUGADORES
        page= Placeholder();
        break;
      case 4://ANALITICOS
        page = Placeholder();
        break;
      case 5: //PRODUCTOS
        page = Placeholder();
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
                      icon: Icon(iconScanQR,color:destinationIcon), 
                      selectedIcon: Icon(iconScanQR,color:destinationIconSelected),
                      label: Text('Scanear QR',style: LabelStyle),
                    ),
                    
                    NavigationRailDestination(
                      icon: Icon(iconMods,color:destinationIcon), 
                      selectedIcon: Icon(iconMods,color:destinationIconSelected),
                      label: Text('Moderadores',style: LabelStyle),
                      disabled: false,  // administrar permisos de mods
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconJugadores,color:destinationIcon),
                      selectedIcon: Icon(iconJugadores,color:destinationIconSelected), 
                      label: Text('Jugadores',style: LabelStyle),
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconBarrchart,color:destinationIcon),
                      selectedIcon: Icon(iconBarrchart,color:destinationIconSelected), 
                      label: Text('Analíticos',style: LabelStyle),
                    ),
                    NavigationRailDestination(
                      icon: Icon(iconProducts,color:destinationIcon), 
                      selectedIcon: Icon(iconProducts,color:destinationIconSelected),
                      label: Text('Productos',style: LabelStyle),
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