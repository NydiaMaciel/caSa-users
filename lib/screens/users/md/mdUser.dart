import 'package:demo_casa_3/screens/users/md/desktop/desktopScaffold.dart';
import 'package:demo_casa_3/screens/users/md/mobile/mobileScaffold.dart';
import 'package:demo_casa_3/screens/users/md/modUserLayout.dart';
import 'package:flutter/material.dart';

class MdUser extends StatefulWidget {
  String usuario;
  MdUser({super.key,required this.usuario});

  @override
  State<MdUser> createState() => _MdUserState();
}

class _MdUserState extends State<MdUser> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return ModUserLayout(mobileScaffold: mobileScaffold(usuario: widget.usuario,pag: 0), desktopScaffold: DesktopScaffold(usuario: widget.usuario,));
  }
}