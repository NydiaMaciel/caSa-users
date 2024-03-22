class Jugadores {
  int ID;
  String nombre;
  String usuario;
  String contrasena;
  int puntos;
  bool maximizar=false;
  bool edit=false;
  //double alt=70;

  Jugadores(this.nombre,this.ID,this.usuario,this.contrasena,this.puntos);
}

final List<Jugadores> jugadoreslista = [
  Jugadores("Maria Hernández Cantero",1,'Maria','123123',6),
  Jugadores("Manuel Contreras Jiménez",2,'Manuel','123123',5),
  Jugadores("Valentina Reyes Fernández",3,'ValeReyes','123123',2),
  Jugadores("Natalia Salazar López",4,'Natalia','123123',1),
  Jugadores("Fernanda Cisneros Gomez",5,'Cisneros','123123',24),
  Jugadores("Alberto Reyes Hernandez",6,'ChicoBeto','123123',3),
  Jugadores("Aranza Urrutia Cisneros",7,'AraUru','123123',12),
  Jugadores("Andrés Fernandez Salazar",8,'Salazar','123123',4),
  Jugadores("Luisa Altamirano Osorio",9,'Osorio','123123',7),
  Jugadores("Alfredo Soriano Rios",10,'FefoSR','123123',3),
  Jugadores("Raymundo Caseco Rios",11,'Ray','123123',17),
  Jugadores("Julian Cruz Altamirano",12,'Juli','123123',3),
  Jugadores("Itahi López lópez",13,'user','Itha',13),
  Jugadores("Itandehui Aparicio Ramirez",14,'Tandy','123123',6),
  Jugadores("Eliomar Rojas Gutierrez",15,'Eliomar','123123',8),
  Jugadores("Nelson Osial Saucedo Maciel",16,'Nelson','123123',5),
  Jugadores("Noel Alejandro Maciel López",17,'Alexito','123123',23),
  Jugadores("Jonathan Reyes Alcaraz",18,'Jona','123123',16),
  Jugadores("Jenifer Gonzales Urrutia",19,'Jennie','123123',18),
  Jugadores("Anatacio Gracpia Jimenez",20,'Tacho','123123',2),
  Jugadores("Mariana Morales Elorza",21,'Mar','123123',23),
  Jugadores("Manuel Soriano Soriano",22,'Mane','123123',8),
];