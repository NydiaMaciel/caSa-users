import 'package:demo_casa_3/screens/data/productosClass.dart';
import 'package:demo_casa_3/screens/generals/icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

final List<Productos> lista = productoslista;
final TextEditingController ctrl_nombre = new TextEditingController();
final TextEditingController ctrl_precio = new TextEditingController();

class ProductosTab extends StatefulWidget {
  @override
  _ProductosTab createState()=> _ProductosTab();
}

class _ProductosTab extends State <ProductosTab>{
  bool sortAscending = true;
  bool editflag = false;

  onSortColumn(int colIndex, bool ascending){
    if(colIndex==0){
      if(ascending){
        lista.sort((a,b)=>a.Nombre.compareTo(b.Nombre));
      }else{
        lista.sort((a,b)=>b.Nombre.compareTo(a.Nombre));
      }
    }else if(colIndex==0){
      if(ascending){
        lista.sort((a,b)=>a.Precio.compareTo(b.Precio));
      }else{
        lista.sort((a,b)=>b.Precio.compareTo(a.Precio));
      }
    }
  }
  @override
  Widget build (BuildContext context){
    double MQwidht = MediaQuery.of(context).size.width;
    bool responsive = MQwidht>1100? true:false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(iconAdd),
        elevation:5.0,
        onPressed: ()async{
          await showDialog<void>(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Agregar producto'),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    TextFormField(
                      controller: ctrl_nombre,
                      decoration: InputDecoration(
                        labelText: 'Producto',
                        labelStyle: const TextStyle(fontSize: 14),
                        enabled: true,
                      ),
                    ),
                    TextFormField(
                      controller: ctrl_precio,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.{0,1}\d{0,2}$'))],
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        labelStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Icon(iconPesos,size: 20,),
                        enabled: true,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                FilledButton.tonal(
                  child: const Text('Cancelar'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                ),
                FilledButton(
                  child: const Text('Agregar'),
                  onPressed: (){
                    setState(() {
                      if(ctrl_nombre.text!='' && ctrl_precio.text!=''){
                        List<Productos> tmp = lista;
                        tmp.sort((a, b) => a.ID.compareTo(b.ID));
                        int mayor = !(tmp[0].ID>tmp[tmp.length-1].ID)?tmp[tmp.length-1].ID:tmp[0].ID;
                        lista.add(Productos(ID: mayor+1, Nombre: ctrl_nombre.text, Precio: double.parse(ctrl_precio.text), edit: false));
                      }
                      ctrl_nombre.text='';
                      ctrl_precio.text='';
                      Navigator.of(context).pop();
                    });
                  }, 
                ),
              ],
            )
          );
        },
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              height:MediaQuery.of(context).size.height*0.80,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Producto'),
                      tooltip: 'Producto',
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          //
                        });
                      },
                    ),
                    DataColumn(
                      label: Text('Precio'),
                      tooltip: 'Precio',
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          //
                        });
                      },
                    ),
                    DataColumn(
                      label: Text('Editar/Eliminar'),
                      tooltip: 'Ediar/Eliminar producto'
                    )
                  ], 
                  rows: lista.map<DataRow>((Productos data){
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(data.Nombre),
                        ),
                        DataCell(
                          Text('\$'+data.Precio.toString()),
                        ),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(iconEdit,size: 20,color: Color.fromARGB(255, 30, 104, 214),),
                                onPressed: (){
                                  setState(() {
                                    ctrl_nombre.text = data.Nombre;
                                    ctrl_precio.text = data.Precio.toString();
                                  });
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context, 
                                    builder:(BuildContext context){
                                      return AlertDialog(
                                        content: StatefulBuilder(
                                          builder: (BuildContext contex, StateSetter setState){
                                            return Container(
                                              width: 300,
                                              height: 150,
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Text('Editar',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                                  SizedBox(height: 5,),
                                                  TextFormField(
                                                    controller:ctrl_nombre,
                                                    //initialValue: ctrl_nombre.text,
                                                    keyboardType: TextInputType.name,
                                                    style: TextStyle(fontSize: 17,color: Colors.black87),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        ctrl_nombre.text=value;
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(height: 5,),
                                                  TextFormField(
                                                    controller: ctrl_precio,
                                                    //initialValue: ctrl_precio.text,
                                                    keyboardType: TextInputType.number,
                                                    style: TextStyle(fontSize: 17,color: Colors.black87),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        ctrl_precio.text=value;
                                                        //data.Precio=double.parse(value);
                                                      });
                                                    },
                                                  ),
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
                                          FilledButton(
                                            child: Text('Aceptar'),
                                            onPressed: (){
                                              setState(() {
                                                data.Nombre=ctrl_nombre.text;
                                                data.Precio=double.parse(ctrl_precio.text);
                                              });
                                              Navigator.of(context).pop();
                                            }, 
                                          ),
                                        ],
                                      );}
                                    );
                                }, 
                              ),
                              IconButton(
                                icon: Icon(Icons.delete,size: 20,color: const Color.fromARGB(255, 138, 37, 30),),
                                onPressed: () {
                                  setState(() {
                                    lista.removeWhere((item) => item.ID == data.ID);
                                  });
                                },
                              ),
                            ],
                          )
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            //SizedBox(height: 500,)
          ],
        ),
      ),
    );
  } 
}
