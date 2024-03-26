import 'package:demo_casa_3/screens/data/moderadoresClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String link = 'http://5.78.109.161/api/';

class Services{
  //https://b5a1-2806-262-41b-aae-f8df-4dff-d0cf-53cf.ngrok-free.app/api/docs
  getModerator(String usr, String pwd)async{
    var url = Uri.parse(link+'moderators/');
    var response = await http.get(url);
    print("Response.code: ${response.statusCode}");
    print("Response.body: ${response.body}");
  }
  
  Future getModerators()async{
    try{
      var url = Uri.parse(link+'moderators/');
      var response = await http.get(url);
      print("Response.code: ${response.statusCode}");
      print("Response.body: ${response.body}");
      
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('data:'+data.toString());
        print('data.type: '+data.runtimeType.toString());
        return data;
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}