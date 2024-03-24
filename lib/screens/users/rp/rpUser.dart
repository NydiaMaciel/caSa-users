import 'package:demo_casa_3/screens/users/rp/desktop/desktopScaffold.dart';
import 'package:demo_casa_3/screens/users/rp/mobile/mobileScaffold.dart';
import 'package:demo_casa_3/screens/users/rp/rpUserLayout.dart';
import 'package:flutter/material.dart';

class RpUser extends StatefulWidget {
  String usuario;
  RpUser({super.key, required this.usuario});

  @override
  State<RpUser> createState() => _RpUserState();
}

class _RpUserState extends State<RpUser> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return RpUserLayout(mobileScaffold: mobileScaffold(usuario: widget.usuario,), desktopScaffold: DesktopScaffold(usuario: widget.usuario,));
  }
}