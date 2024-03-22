class Moderadores {
  String nombre;
  String usuario;
  int ID;
  bool p1;
  bool p2;
  bool p3;
  bool p4;
  bool p5;
  bool maximizar=false;
  bool edit=false;
  double alt=70;

  Moderadores(this.nombre,this.ID,this.p1,this.p2,this.p3,this.p4,this.p5,this.usuario);

  String getnombre(){return nombre;}
  bool getp1(){return p1;}
  bool getp2(){return p2;}
  bool getp3(){return p3;}
  bool getp4(){return p4;}
  bool getp5(){return p5;}

  void setnombre(String name){nombre = name;}
  void setp1(bool p){p1 = p;}
  void setp2(bool p){p2 = p;}
  void setp3(bool p){p3 = p;}
  void setp4(bool p){p4 = p;}
  void setp5(bool p){p5 = p;}

}

final List<Moderadores> moderadoreslista = [
  Moderadores("Maria Hernández Cantero",1,false,true,false,true,true,'Maria'),
  Moderadores("Manuel Contreras Jiménez",2,true,false,false,true,false,'Manuel'),
  Moderadores("Valentina Reyes Fernández",3,false,true,true,false,false,'Vale'),
  Moderadores("Natalia Salazar López",4,false,true,false,false,false,'Nat'),
  Moderadores("Fernanda Cisneros Gomez",5,false,true,false,true,true,'Fer'),
  Moderadores("Alberto Reyes Hernandez",6,true,false,false,true,false,'Beto'),
  Moderadores("Aranza Urrutia Cisneros",7,false,true,true,false,false,'Ara'),
  Moderadores("Andrés Fernandez Salazar",8,false,true,false,false,false,'Andres'),
  Moderadores("Luisa Altamirano Osorio",9,false,true,false,true,true,'Luisa'),
  Moderadores("Alfredo Soriano Rios",10,true,false,false,true,false,'Fedo'),
  Moderadores("Raymundo Caseco Rios",11,false,true,true,false,false,'Ray'),
  Moderadores("Julian Cruz Altamirano",12,false,true,false,false,false,'Juli'),
  Moderadores("Itahi López lópez",13,false,true,false,true,true,'Ita'),
  Moderadores("Itandehui Aparicio Ramirez",14,true,false,false,true,false,'Tandy'),
  Moderadores("Eliomar Rojas Gutierrez",15,false,true,true,false,false,'Eliomar'),
  Moderadores("Nelson Osial Saucedo Maciel",16,false,true,false,false,false,'Nelson'),
  Moderadores("Noel Alejandro Maciel López",17,false,true,false,true,false,'Alexito'),
];