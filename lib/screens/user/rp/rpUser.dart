import 'package:casa/screens/user/desktop/desktopScaffold.dart';
import 'package:casa/screens/user/mobile/mobileScaffold.dart';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:casa/screens/user/rp/rpUserLayout.dart';
import 'package:flutter/material.dart';

class RpUser extends StatefulWidget {
  Jugadores usuario;
  RpUser({super.key, required this.usuario});

  @override
  State<RpUser> createState() => _RpUserState();
}

class _RpUserState extends State<RpUser> {
  @override
  Widget build(BuildContext context) {
    return RpUserLayout(mobileScaffold: mobileScaffold(usuario: widget.usuario,), desktopScaffold: DesktopScaffold(usuario: widget.usuario,));
  }
}