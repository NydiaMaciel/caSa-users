import 'package:flutter/services.dart';
class Productos {
  int ID;
  String Nombre;
  double Precio;
  bool edit;

  Productos({required this.ID,required this.Nombre,required this.Precio,required this.edit});
  
  int getID(){return ID;}
  String getnombre(){return Nombre;}
  double getprecio(){return Precio;}
  void setNombre(String dato){Nombre=dato;}
  void setPrecio(double dato){Precio=dato;}

}

List <Productos> productoslista = [
  Productos(ID:4 , Nombre:'Botella Vino', Precio:350.0,edit: false),
  Productos(ID:1 , Nombre:'Ensalada César', Precio:150.5,edit: false),
  Productos(ID:5 , Nombre:'Cahuama Victoria', Precio:75.5,edit: false),
  Productos(ID:2 , Nombre:'Totopos', Precio:50.0,edit: false),
  Productos(ID:3 , Nombre:'Corona 600ml', Precio:35.5,edit: false),
  Productos(ID:6 , Nombre:'Refresco', Precio:25.0,edit: false),
  //
  Productos(ID:4 , Nombre:'Botella Vino', Precio:350.0,edit: false),
  Productos(ID:1 , Nombre:'Ensalada César', Precio:150.5,edit: false),
  Productos(ID:5 , Nombre:'Cahuama Victoria', Precio:75.5,edit: false),
  Productos(ID:2 , Nombre:'Totopos', Precio:50.0,edit: false),
  Productos(ID:3 , Nombre:'Corona 600ml', Precio:35.5,edit: false),
  Productos(ID:6 , Nombre:'Refresco', Precio:25.0,edit: false),
  Productos(ID:4 , Nombre:'Botella Vino', Precio:350.0,edit: false),
  Productos(ID:1 , Nombre:'Ensalada César', Precio:150.5,edit: false),
  Productos(ID:5 , Nombre:'Cahuama Victoria', Precio:75.5,edit: false),
  Productos(ID:2 , Nombre:'Totopos', Precio:50.0,edit: false),
  Productos(ID:3 , Nombre:'Corona 600ml', Precio:35.5,edit: false),
  Productos(ID:6 , Nombre:'Refresco', Precio:25.0,edit: false),
];