import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/generals/icons.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  
  @override
  _RegState createState()=> _RegState();
}

class _RegState extends State <Register>{

  bool pwdhide1 = true;
  bool pwdhide2 = true;

  final TextEditingController name_ctrlr = new TextEditingController();
  final TextEditingController mail_ctrlr = new TextEditingController();
  final TextEditingController user_ctrlr = new TextEditingController();
  final TextEditingController ntel_ctrlr = new TextEditingController();
  final TextEditingController pwd1_ctrlr = new TextEditingController();
  final TextEditingController pwd2_ctrlr = new TextEditingController();
  final TextEditingController type_ctrlr = new TextEditingController();
  @override
  Widget build (BuildContext context){
  double sizeicon = 15;
  double sizeiconHide = 20.0;

  bool responsive = MediaQuery.of(context).size.width<1100;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Registro",
                style: TextStyle(
                  color: iconColorForm,
                  fontFamily: "Wenstern",
                  fontSize: responsive?30:40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: responsive? MediaQuery.of(context).size.width*0.93:MediaQuery.of(context).size.width*0.40,
                padding: EdgeInsets.all(responsive? 15:30,),
                  decoration: BoxDecoration(
                    color: BGform,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:Column(//////CAMPOS
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: responsive? MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width/3*0.50,//MediaQuery.of(context).size.width/3*0.50,
                            child: TextFormField(
                              controller: user_ctrlr,
                              decoration: InputDecoration(
                                  labelText: 'Usuario',
                                  suffixIconConstraints: BoxConstraints(minHeight: 20,minWidth: 20),
                                  suffixIcon: Icon(iconUsuario, size:responsive?14:sizeicon,color:iconColorForm,),
                                  enabled: true,
                                ),
                                validator: (value) {
                                if(value!.length == 0){
                                  return "Ingrese un nombre de usuario.";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: responsive? MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width/3*0.50,//MediaQuery.of(context).size.width/3*0.50,,
                            child: TextFormField(
                              controller: ntel_ctrlr,
                              decoration: InputDecoration(
                                  labelText: 'Teléfono',
                                  suffixIconConstraints: BoxConstraints(minHeight: 20,minWidth: 20),
                                  suffixIcon: Icon(iconPhone, size:responsive?14:sizeicon,color:iconColorForm),
                                  enabled: true,
                                ),
                              validator: (value) {
                                if(value!.length == 0){
                                  return "Ingrese un número telefónico";
                                }
                                if (!RegExp("^(?:[+0]9)?[0-9]{10}").hasMatch(value)) {
                                  return ("Por favor, ingrese un número válido.");
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: mail_ctrlr,
                        decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          suffixIconConstraints: BoxConstraints(minHeight: 20,minWidth: 20),
                          suffixIcon: Icon(iconArroba, size:responsive?15:sizeicon,color:iconColorForm),
                          enabled: true,
                        ),
                        validator: (value) {
                          if(value!.length == 0){
                            return "Ingrese su correo electrónico";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                            return ("Por favor, ingrese un correo válido.");
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      responsive? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            obscureText: pwdhide1,
                            controller: pwd1_ctrlr,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              suffixIcon: IconButton(
                                icon: Icon(pwdhide1 ? Icons.visibility_off : Icons.visibility, size: sizeiconHide,color:iconColorForm),
                                onPressed: () {
                                  setState(() {
                                      pwdhide1 = !pwdhide1;
                                  });
                                },
                              ),
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
                          TextFormField(
                            obscureText: pwdhide2,
                            controller: pwd2_ctrlr,
                            decoration: InputDecoration(
                              labelText: 'Confirme contraseña',
                              suffixIcon: IconButton(
                                icon: Icon(pwdhide2 ? Icons.visibility_off : Icons.visibility,size: sizeiconHide,color:iconColorForm),
                                onPressed: () {
                                  setState(() {
                                    pwdhide2 = !pwdhide2;
                                  });
                                },
                              ),
                              enabled: true,
                            ),
                            validator: (value) {
                              if (value!.isEmpty){
                                return "Ingrese la contraseña.";
                              }
                              if (pwd2_ctrlr.value != pwd1_ctrlr.value) {
                                return ("Las contraseñas no coinciden, inténtalo de nuevo.");
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ):Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3*0.50,
                            child: TextFormField(
                              obscureText: pwdhide1,
                              controller: pwd1_ctrlr,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                suffixIcon: IconButton(
                                  icon: Icon(pwdhide1 ? Icons.visibility_off : Icons.visibility, size: sizeiconHide,color:iconColorForm),
                                  onPressed: () {
                                    setState(() {
                                       pwdhide1 = !pwdhide1;
                                    });
                                  },
                                ),
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
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3*0.50,
                            child: TextFormField(
                              obscureText: pwdhide2,
                              controller: pwd2_ctrlr,
                              decoration: InputDecoration(
                                labelText: 'Confirme contraseña',
                                suffixIcon: IconButton(
                                  icon: Icon(pwdhide2 ? Icons.visibility_off : Icons.visibility,size: sizeiconHide,color:iconColorForm),
                                  onPressed: () {
                                    setState(() {
                                      pwdhide2 = !pwdhide2;
                                    });
                                  },
                                ),
                                enabled: true,
                              ),
                              validator: (value) {
                                if (value!.isEmpty){
                                  return "Ingrese la contraseña.";
                                }
                                if (pwd2_ctrlr.value != pwd1_ctrlr.value) {
                                  return ("Las contraseñas no coinciden, inténtalo de nuevo.");
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
              ),
              SizedBox(height: 20,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: fucsia,
                  padding: EdgeInsets.symmetric(vertical:responsive?10.0:20.0, horizontal:50.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                },  
                child: const Text('Registrar', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Wenstern',
                  fontWeight: FontWeight.w700
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