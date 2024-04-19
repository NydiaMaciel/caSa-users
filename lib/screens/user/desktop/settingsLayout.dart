import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/generals/settings.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:casa/services/sessions.dart';
import 'package:flutter/material.dart';

class SetingsLayout extends StatelessWidget {
  Jugadores usuario;
  Sesion dataSesion;
  SetingsLayout({super.key,required this.usuario, required this.dataSesion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPanelEmpty,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width/2,
          child: Settings(usuario: usuario, dataSesion: dataSesion),
        ),
      ),
    );
  }
}