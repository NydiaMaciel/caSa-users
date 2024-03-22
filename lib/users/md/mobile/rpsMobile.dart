import 'package:demo_casa_3/data/jugadoresClass.dart';
import 'package:demo_casa_3/icons.dart';
import 'package:flutter/material.dart';


class RpsMobile extends StatefulWidget {
  const RpsMobile({super.key});

  @override
  State<RpsMobile> createState() => _RpsMobileState();
}

class _RpsMobileState extends State<RpsMobile> {
  bool sortAscendingPuntos = true;
  bool sortAscendingBoletos = true;
  List<Jugadores> lista = jugadoreslista;
  TextEditingController ctrl_query = new TextEditingController();
  bool iconSearchBarCancel=false;

  onSortColumn(int colIndex, bool ascending){
    if(colIndex==1){
      if(ascending){
        lista.sort((a,b)=>a.puntos.compareTo(b.puntos));
      }else{
        lista.sort((a,b)=>b.puntos.compareTo(a.puntos));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //buscador
          Container(
            margin:const EdgeInsets.all(10),
            height: 50,
            child: TextField(
              controller: ctrl_query,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                labelStyle: TextStyle(fontSize: 5),
                prefixIcon: const Icon(Icons.search,size: 25,),
                suffixIcon: iconSearchBarCancel? IconButton(
                  icon: Icon(iconX,size: 17,),
                  onPressed: (){
                    setState(() {
                      ctrl_query.text="";
                      lista=jugadoreslista;
                      iconSearchBarCancel=false;
                    });
                  },
                ):null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                ),
              ),
              onChanged: (value){
                setState(() {
                  if(value==""){
                    lista=jugadoreslista;
                    iconSearchBarCancel=false;
                  }else{
                    iconSearchBarCancel=true;
                    lista=filter(value);
                  }
                });
              },
            ),
          ),
          //Lista
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: SingleChildScrollView(
              child: DataTable(
                sortColumnIndex: 1,
                sortAscending: sortAscendingPuntos,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text('Nombre', style: TextStyle(fontSize: 17)),
                  ),
                  DataColumn(
                    label: Text('Puntos', style: TextStyle(fontSize: 17)),
                    onSort: (columnIndex,ascending){
                      setState(() {
                        sortAscendingPuntos=!sortAscendingPuntos;
                        onSortColumn(columnIndex,ascending);
                      });
                    },
                  ),
                  DataColumn(
                    label: Text('Boletos', style: TextStyle(fontSize: 17)),
                  ),
                ], 
                rows: lista.map<DataRow>((Jugadores data){
                  return DataRow(
                    onLongPress: () {
                      showDialog(
                        //barrierDismissible: false,
                        context: context, 
                        builder:(BuildContext context){
                          return AlertDialog(
                            content: StatefulBuilder(
                              builder: (BuildContext contex, StateSetter setState){
                                return Container(
                                  width: 300,
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text("Total bebidas canjeadas: 43", style: TextStyle(fontSize: 18)),
                                      Text("Bebidas canjeadas [mes]: 17", style: TextStyle(fontSize: 18)),
                                      Text("Bebidas canjeadas [semana]: 8", style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                );
                                }
                              ),
                            actions: [
                              FilledButton.tonal(
                                child: Text('Salir'),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                }, 
                              ),
                            ],
                          );}
                        );
                    },
                    cells:<DataCell>[
                      DataCell(Text(data.usuario,style: TextStyle(fontSize: 17))),
                      DataCell(
                        Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          alignment: Alignment.center,
                          child: Text(data.puntos.toString(),style: TextStyle(fontSize: 17))
                        )
                      ),
                      DataCell(Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          alignment: Alignment.center,
                          child: Text(data.puntos.toString(),style: TextStyle(fontSize: 17))
                        )
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Jugadores> filter (String query){
    final cards = jugadoreslista.where((element) {
      String lowerName = element.usuario.toLowerCase();
      String lowerQuery = query.toLowerCase();
      return lowerName.contains(lowerQuery);
    }).toList();
    return cards;
  }

}