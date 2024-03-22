import 'package:demo_casa_3/generals/recupwd.dart';
import 'package:demo_casa_3/generals/register.dart';
import 'package:demo_casa_3/users/md/mdUser.dart';
import 'package:demo_casa_3/users/rp/rpUser.dart';
import 'package:flutter/material.dart';
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
    Color iconcolor = Colors.black45;
    double sizeicon = 17;
    bool responsive_ = MediaQuery.of(context).size.width<1100;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255,86,86,86),
                Color.fromARGB(255,143,216,196),
              ]
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
                    fontFamily: 'Retrolight', //NeonBlitz - Retrolight - street
                    color: Color.fromARGB(255,237,39,136),
                  ),
                ),
                SizedBox( height: 20,),
                Container(
                  width: responsive_? MediaQuery.of(context).size.width*0.70:350,
                  padding: EdgeInsets.all(responsive_?15:30),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(192, 230, 204, 179),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text("Inicia Sesión",
                        style: TextStyle(
                          color: iconcolor,
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
                          suffixIcon: Icon(iconUsuario, size:sizeicon,color: iconcolor,),
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
                        obscureText: true,
                        controller: pswd,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          enabled: true,
                          suffixIcon: Icon(iconPassword, size:sizeicon,color: iconcolor,),
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
                        onChanged: (value) {},
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
                              child: const Text('Olvidé mi contraseña',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255,237,39,136),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive_?40:25,),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255,237,39,136),
                          padding: EdgeInsets.symmetric(vertical:responsive_? 10.0:20.0, horizontal:50.0),//mobile:desktop 
                        ),
                        onPressed: () {                  
                          if(user.text.toLowerCase()=="rp"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RpUser(usuario: user.text)));
                          }
                          if(user.text.toLowerCase()=="admin"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MdUser()));
                          }
                          if(user.text.toLowerCase()=="mod"){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MdUser()));
                          }
                        },  
                        child: const Text('entrar', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Wenstern',
                          fontWeight: FontWeight.w700
                          ),
                        ),
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
                                  color: Color.fromARGB(255,237,39,136),
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
}