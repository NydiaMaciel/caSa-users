import 'package:demo_casa_3/users/md/desktop/desktopScaffold.dart';
import 'package:demo_casa_3/users/md/mobile/mobileScaffold.dart';
import 'package:demo_casa_3/users/md/modUserLayout.dart';
import 'package:flutter/material.dart';

class MdUser extends StatefulWidget {
  const MdUser({super.key});

  @override
  State<MdUser> createState() => _MdUserState();
}

class _MdUserState extends State<MdUser> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return ModUserLayout(mobileScaffold: mobileScaffold(), desktopScaffold: DesktopScaffold());
  }
}