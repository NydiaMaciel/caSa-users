import 'package:demo_casa_3/generals/icons.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Recup extends StatefulWidget {
  @override
  _RecupState createState()=> _RecupState();
}

class _RecupState extends State <Recup>{
  TextEditingController ctrl_user = new TextEditingController();
  TextEditingController ctrl_email = new TextEditingController();
  @override
  Widget build (BuildContext context){
    double MQwidth = MediaQuery.of(context).size.width;
    //print('$MQwidth');
    bool responsive_ = MQwidth<1100;
    Color iconcolor = Colors.black45;
    double sizeicon = 17;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //255, 183, 163, 144
                //Color.fromARGB(255, 75, 75, 75),
                Color.fromARGB(255,86,86,86),
                Color.fromARGB(255,143,216,196),
                //Color.fromARGB(255, 81, 144, 127),
              ]
            )
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Recuperar Contraseña",
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsive_?30:40,
                  fontFamily: 'Wenstern',
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: responsive_?MQwidth*0.85:MQwidth*0.50,
                padding: EdgeInsets.all(responsive_?20:30),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230,204,179),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text('Ingrese su usuario y correo electrónico, se enviará un correo de recuperación.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color.fromARGB(148, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Vintage Avalanche'
                      ),),
                      TextFormField(
                        controller: ctrl_user,
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          suffixIcon: Icon(iconUsuario, size:responsive_?13:sizeicon,color: iconcolor,),
                          enabled: true,
                        ),
                        validator: (value) {
                          if(value!.length == 0){
                            return "Ingrese su nombre de usuario";
                          }
                        },
                      ),
                      TextFormField(
                        controller: ctrl_email,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          suffixIcon: Icon(iconArroba, size:responsive_?13:sizeicon,color: iconcolor,),
                          enabled: true,
                        ),
                        validator: (value) {
                          if(value!.length == 0){
                            return "Ingrese su correo electrónico";
                          }
                        },
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 20,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255,237,39,136),
                  padding: EdgeInsets.symmetric(vertical:15.0, horizontal:50.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                },  
                child: const Text('enviar', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Wenstern',
                  fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ), 
          
          
          
          
          
          
        ),
      ),
    );
  }
}