import 'package:demo_casa_3/data/moderadoresClass.dart';
import 'package:demo_casa_3/generals/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/painting/box_border.dart';

class ModsMobile extends StatefulWidget{
  @override
  _ModsMobile createState()=>_ModsMobile();
}

double alt=40;
final TextEditingController ctrl_nombre = new TextEditingController();
final TextEditingController ctrl_query = new TextEditingController();
bool iconSearchBarCancel=false;
bool flag_permiso1 = false;
bool flag_permiso2 = false;
bool flag_permiso3 = false;
bool flag_permiso4 = false;
bool flag_permiso5 = false;

List<Moderadores> lista = moderadoreslista;

class _ModsMobile extends State<ModsMobile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
      child: Icon(iconAdd),
      elevation:5.0,
      onPressed: (){
        showDialog(
          barrierDismissible: false,
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              insetPadding: EdgeInsets.all(20),
              content: StatefulBuilder(
                builder: (BuildContext contex, StateSetter setState){
                  return Container(
                    height:300,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: ctrl_nombre,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(fontSize: 14),
                            enabled: true,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children:[
                            Text('Permiso 1'),
                            SizedBox(width: 5,),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                              value: flag_permiso1,
                              activeColor: Color.fromARGB(255, 57, 132, 59),
                              onChanged: (value){
                                setState(() {
                                  flag_permiso1=value;
                                });
                              }),
                            )
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children:[
                            Text('Permiso 2'),
                            SizedBox(width: 10,),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                              value: flag_permiso2,
                              activeColor: Color.fromARGB(255, 57, 132, 59),
                              onChanged: (value){
                                setState(() {
                                  flag_permiso2=value;
                                });
                              }),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children:[
                            const Text('Permiso 3'),
                            const SizedBox(width: 10,),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                              value: flag_permiso3,
                              activeColor: const Color.fromARGB(255, 57, 132, 59),
                              onChanged: (value){
                                setState(() {
                                  flag_permiso3=value;
                                });
                              }),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children:[
                            const Text('Permiso 4'),
                            const SizedBox(width: 10,),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                              value: flag_permiso4,
                              activeColor: Color.fromARGB(255, 57, 132, 59),
                              onChanged: (value){
                                setState(() {
                                  flag_permiso4=value;
                                });
                              }),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children:[
                            Text('Permiso 5'),
                            SizedBox(width: 10,),
                            Transform.scale(
                              scale: 0.7,
                              child: Switch(
                              value: flag_permiso5,
                              activeColor: const Color.fromARGB(255, 57, 132, 59),
                              onChanged: (value){
                                setState(() {
                                  flag_permiso5=value;
                                });
                              }),
                            )
                          ],
                        ),
                      ],
                    )
                  );
                },
              ),
              actions: [
              FilledButton.tonal(
                child: Text('Cancelar'),
                onPressed: (){
                  ctrl_nombre.text="";
                  flag_permiso1=false;
                  flag_permiso2=false;
                  flag_permiso3=false;
                  flag_permiso4=false;
                  flag_permiso5=false;
                  Navigator.of(context).pop();
                }, 
              ),
              FilledButton(
                child: Text('Agregar'),
                onPressed: (){
                  setState(() {
                    int newID=lista[lista.length-1].ID + 1;
                    lista.add(Moderadores(ctrl_nombre.text, newID, flag_permiso1, flag_permiso2, flag_permiso3, flag_permiso4, flag_permiso5,'username'));
                    //limpia variables
                    ctrl_nombre.text="";
                    flag_permiso1=false;
                    flag_permiso2=false;
                    flag_permiso3=false;
                    flag_permiso4=false;
                    flag_permiso5=false;
                    Navigator.of(context).pop();
                  });
                }, 
              ),
            ],
            );
          },
        );
      },
    ),
      //************************************************************************** */
      //************************************************************************** */
      //************************************************************************** */
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
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
                      lista=moderadoreslista;
                      iconSearchBarCancel=false;
                    });
                  }, 
                ):null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 255, 112, 193)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if(value==""){
                    lista=moderadoreslista;
                    iconSearchBarCancel=false;
                  }else{
                    iconSearchBarCancel=true;
                    lista=filter(value);
                  }
                });
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            //constraints: BoxConstraints(minWidth:1265.6, minHeight:0.0,maxHeight:double.infinity),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: lista.length,
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  margin: EdgeInsets.all(3.0),
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    
                    color: Color.fromARGB(255, 240, 225, 235),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                          !lista[index].edit? Text(lista[index].nombre,style: TextStyle(fontSize: 18),):
                          SizedBox(//altura del editor del nombre
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 20),
                              ),
                              initialValue: lista[index].nombre,
                              keyboardType: TextInputType.name,
                              style: TextStyle(fontSize: 17),
                              readOnly: !lista[index].edit,
                              onChanged: (val){
                                setState(() {
                                  lista[index].nombre=val;
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(iconDown),
                            onPressed: (){
                              setState(() {
                                lista[index].maximizar=!lista[index].maximizar;
                              });
                            }, 
                          ),
                        ],
                      ),
                      !lista[index].maximizar? SizedBox(height: 0,):
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [ 
                            Column(
                              children: [ 
                                Row(
                                  children: [
                                    IconButton( 
                                      icon: lista[index].p1?Icon(iconCheckBox,size: 25,):Icon(iconCheckBoxBlank,size:25), 
                                      onPressed: (){
                                        setState(() {
                                          lista[index].p1=!lista[index].p1;
          
                                        });
                                      },),
                                    Text('Permiso 1',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton( 
                                      icon: lista[index].p2?Icon(iconCheckBox,size: 25,):Icon(iconCheckBoxBlank,size:25), 
                                      onPressed: (){
                                        setState(() {
                                          lista[index].p2=!lista[index].p2;
                                        });
                                      },),
                                    Text('Permiso 2',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton( 
                                      icon: lista[index].p3?Icon(iconCheckBox,size: 25,):Icon(iconCheckBoxBlank,size:25), 
                                      onPressed: (){
                                        setState(() {
                                          lista[index].p3=!lista[index].p3;
                                        });
                                      },),
                                    Text('Permiso 3',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton( 
                                      icon: lista[index].p4?Icon(iconCheckBox,size: 25,):Icon(iconCheckBoxBlank,size:25), 
                                      onPressed: (){
                                        setState(() {
                                          lista[index].p4=!lista[index].p4;
                                        });
                                      },),
                                    Text('Permiso 4',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton( 
                                      icon: lista[index].p5?Icon(iconCheckBox,size: 25,):Icon(iconCheckBoxBlank,size:25), 
                                      onPressed: (){
                                        setState(() {
                                          lista[index].p5=!lista[index].p5;
                                        });
                                      },),
                                    Text('Permiso 5',style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [ 
                                  IconButton( 
                                    icon: Icon(iconEdit,),
                                    color: lista[index].edit?const Color.fromARGB(255, 59, 136, 62):Colors.grey,
                                    onPressed: () {
                                      setState(() {
                                        lista[index].edit=!lista[index].edit;
                                      });
                                    },),
                                  SizedBox(height: 10,),
                                  IconButton( icon: Icon(iconDel),
                                    color: const Color.fromARGB(255, 202, 37, 25),
                                    onPressed: () {
                                      setState(() {
                                        lista.removeAt(index);
                                      });
                                    },),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  List<Moderadores> filter (String query){
    final cards = moderadoreslista.where((element) {
      String lowerName = element.nombre.toLowerCase();
      String lowerQuery = query.toLowerCase();
      return lowerName.contains(lowerQuery);
    }).toList();
    return cards;
  }
}

