import 'dart:async';
import 'dart:convert';
import 'package:casa/screens/user/rp/jugadores.dart';
import 'package:flutter/material.dart';
import 'package:casa/services/services.dart';
import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/generals/recupwd.dart';
import 'package:casa/screens/generals/register.dart';
import 'package:casa/screens/user/rp/rpUser.dart';
import 'icons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState()=> _LoginState();
}

class _LoginState extends State <Login>{
  TextEditingController user = new TextEditingController();
  TextEditingController pswd = new TextEditingController();

  @override
  Widget build (BuildContext context){
    double sizeicon = 17;
    bool responsive_ = MediaQuery.of(context).size.width<1100;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [BGgradLoginSUP,BGgradLoginINF],
            )
          ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: responsive_? MediaQuery.of(context).size.width*0.80:MediaQuery.of(context).size.width*0.50,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: responsive_? 190:150,//mobile:desktop,
                  width: responsive_? 190:150,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage('images/logo.jpeg'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                ),
                SizedBox( height: responsive_?10:1,),
                Text("c∙a∙S∙a",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Retrolight', 
                    color: fucsia,
                  ),
                ),
                SizedBox( height: 20,),
                Container(
                  width: responsive_? MediaQuery.of(context).size.width*0.70:350,
                  padding: EdgeInsets.all(responsive_?15:30),
                  decoration: BoxDecoration(
                    color: BGform,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text("Inicia Sesión",
                        style: TextStyle(
                          color: iconColorForm,
                          fontFamily: "Wenstern",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox( height: 10,),
                      TextFormField(
                        controller: user,
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          enabled: true,
                          suffixIcon: Icon(iconUsuario, size:sizeicon,color: iconColorForm,),
                        ),
                        validator: (value) {
                          if(value!.length == 0){
                            return "Ingrese su nombre de usuario";
                          }
                        },
                        onChanged: (value){},
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        obscureText: false,
                        controller: pswd,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          enabled: true,
                          suffixIcon: Icon(iconPassword, size:sizeicon,color: iconColorForm,),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty){
                            return "Ingrese la contraseña.";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Por favor, ingrese una contraseña minimo de 6 caracteres.");
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: responsive_?15:5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Recup()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 300,
                              child: Text('Olvidé mi contraseña',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: fucsia,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive_?40:25,),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: fucsia,
                          padding: EdgeInsets.symmetric(vertical:responsive_? 10.0:20.0, horizontal:50.0),//mobile:desktop 
                        ),
                        child: const Text('entrar', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Wenstern',
                          fontWeight: FontWeight.w700
                          ),
                        ),
                        onPressed: () async{
                          var resAdministrator;
                          var resModerator;
                          var resUserRP;
                          //LOGIN ADMINISTRADOR
                          try{
                            resUserRP = await Services().login(user.text,pswd.text);
                            resUserRP!=null? print('CODE usr:${resUserRP.statusCode}'): print('CODE usr: null');

                            if(resUserRP!=null){
                              var data = jsonDecode(resUserRP.body);
                              var respById = await Services().getUserById(data['id'],data['access_token']);
                              var json = jsonDecode(respById);
                              Jugadores rp = Jugadores.fromJson(json);
                              setState(() {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RpUser(usuario: rp)));
                              });
                            }else{
                              showAlertLogin();
                            }

                          }catch(e){
                            showAlertLogin();
                            print("Error $e");
                          }
                        },  
                      ),
                      SizedBox(height: responsive_?20:10,),
                      GestureDetector( 
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Crear una cuenta",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: fucsia,
                                ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive_?10:1,),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlertLogin(){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          content: StatefulBuilder(
            builder: (BuildContext contex, StateSetter setState){
              return Container(
                height:50,
                child: const Column(
                  children: [
                    Text('Error de inicio de sesión',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('No se encontró el usuario',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              );
            },
          ),
          actions: [
          FilledButton(
            child: Text('Aceptar'),
            onPressed: (){
              setState(() {
                //limpia variables
                user.text="";
                pswd.text="";
                Navigator.of(context).pop();
              });
            }, 
          ),
        ],
        );
      },
    );
  }
}