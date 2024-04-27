import 'dart:io';

import 'package:casa/screens/generals/colores.dart';
import 'package:casa/screens/generals/icons.dart';
import 'package:casa/services/services.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:toastification/toastification.dart';
import 'package:email_validator/email_validator.dart';


class Register extends StatefulWidget {
  const Register({super.key});
  
  @override
  _RegState createState()=> _RegState();
}

class _RegState extends State <Register>{
  bool errorPwd = false;
  bool errorEml = false;
  bool errorPhn = false;

  bool pwdhide1 = true;
  bool pwdhide2 = true;

  TextEditingController mail_ctrlr = new TextEditingController();
  TextEditingController user_ctrlr = new TextEditingController();
  TextEditingController ntel_ctrlr = new TextEditingController();
  TextEditingController pwd1_ctrlr = new TextEditingController();
  TextEditingController pwd2_ctrlr = new TextEditingController();
  TextEditingController type_ctrlr = new TextEditingController();

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: responsive? MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width/3*0.50,//MediaQuery.of(context).size.width/3*0.50,
                            child: TextFormField(
                              controller: user_ctrlr,
                              cursorColor: color1,
                              cursorHeight: 23,
                              cursorWidth: 1.0,
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
                          Container(
                            width: responsive? MediaQuery.of(context).size.width*0.40:MediaQuery.of(context).size.width/3*0.50,//MediaQuery.of(context).size.width/3*0.50,,
                            height: errorPhn?80:null,
                            child: TextFormField(
                              controller: ntel_ctrlr,
                              cursorColor: color1,
                              cursorHeight: 23,
                              cursorWidth: 1.0,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                
                                  labelText: 'Teléfono',
                                  errorText: errorPhn? 'Número inválido': null,
                                  suffixIconConstraints: BoxConstraints(minHeight: 20,minWidth: 20),
                                  suffixIcon: Icon(iconPhone, size:responsive?14:sizeicon,color:iconColorForm),
                                  enabled: true,
                                ),
                              onChanged: (value) {
                                setState(() {
                                  errorPhn = (!RegExp(r'^[0-9]*$').hasMatch(ntel_ctrlr.text) || value.length>10)? true:false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: mail_ctrlr,
                        cursorColor: color1,
                        cursorHeight: 23,
                        cursorWidth: 1.0,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          errorText: errorEml? 'Formato de correo electrónico inválido':null,
                          suffixIconConstraints: BoxConstraints(minHeight: 20,minWidth: 20),
                          suffixIcon: Icon(iconArroba, size:responsive?15:sizeicon,color:iconColorForm),
                          enabled: true,
                        ),
                        onChanged: (value) {
                          setState(() {
                            errorEml = !EmailValidator.validate(mail_ctrlr.text) && value.length!=0? true:false;

                          });
                        },
                      ),
                      SizedBox(height: 10,),
                      responsive? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            cursorColor: color1,
                            cursorHeight: 23,
                            cursorWidth: 1.0,
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
                            onChanged: (value) {
                                setState(() {
                                  errorPwd = pwd1_ctrlr.text!=pwd2_ctrlr.text? true:false;
                                });
                              },
                          ),
                          TextFormField(
                            obscureText: pwdhide2,
                            controller: pwd2_ctrlr,
                            cursorColor: color1,
                            cursorHeight: 23,
                            cursorWidth: 1.0,
                            decoration: InputDecoration(
                              labelText: 'Confirme contraseña',
                              errorText: errorPwd? 'Las contraseñas no coinciden': null,
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
                            onChanged: (value) {
                                setState(() {
                                  errorPwd = pwd1_ctrlr.text!=pwd2_ctrlr.text? true:false;
                                });
                              },
                          ),
                        ],
                      ):Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3*0.50,
                            child: TextFormField(
                              obscureText: pwdhide1,
                              controller: pwd1_ctrlr,
                              cursorColor: color1,
                              cursorHeight: 23,
                              cursorWidth: 1.0,
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
                              onChanged: (value) {
                                setState(() {
                                  errorPwd = pwd1_ctrlr.text!=pwd2_ctrlr.text? true:false;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3*0.50,
                            height: errorPwd? 80:null,
                            alignment: Alignment.topCenter,
                            child: TextFormField(
                              obscureText: pwdhide2,
                              controller: pwd2_ctrlr,
                              cursorColor: color1,
                              cursorHeight: 23,
                              cursorWidth: 1.0,
                              decoration: InputDecoration(
                                labelText: 'Confirme contraseña',
                                errorText: errorPwd? 'Las contraseñas no coinciden': null,
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
                              onChanged: (value) {
                                setState(() {
                                  errorPwd = pwd1_ctrlr.text!=pwd2_ctrlr.text? true:false;
                                });
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
                onPressed: ()async{

                  var response = await Services().create(user_ctrlr.text, mail_ctrlr.text, pwd1_ctrlr.text, ntel_ctrlr.text);
                  if(response == true){
                    registerDone();
                    sleep(Duration(milliseconds: 5));
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                    });
                  }else{
                    registerError();
                    sleep(Duration(milliseconds: 5));
                  }
                },  
                child: const Text('registrar', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Wenstern',
                  fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  padding: EdgeInsets.symmetric(vertical:responsive?5.0:10.0, horizontal:30.0),
                ),
                onPressed: ()async{
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                  });
                },  
                child: const Text('cancelar', style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Wenstern',
                  fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ), 
          
          
          
          
          
          
        ),
      ),
    );
  }

  void registerError(){
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text('Falló el registro',style: TextStyle(fontSize: 18),),
      description: Text('El usuario ${user_ctrlr.text} no ha podido ser registrado. Es posible que el nombre de usuario ya exista!',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      showProgressBar: false,
    );
  }

  void registerDone(){
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text('Registro exitoso',style: TextStyle(fontSize: 18),),
      description: Text('El usuario ${user_ctrlr.text} fue registrado de manera exitosa.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      showProgressBar: false,
    );
  }

  void noCoincidence(){
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      showProgressBar: false,
      title: Text('Fallo de confirmación ',style: TextStyle(fontSize: 18),),
      description: Text('Las contraseñas no coinciden, ¡vuelva a escribirlas por favor!',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
    );
  }

}