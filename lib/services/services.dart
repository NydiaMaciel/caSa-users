import 'package:http/http.dart' as http;
import 'dart:convert';

String link = 'https://casa-invita.xyz/api/rp-users/';

class Services{
  
  /*Future getAllModerators(String token)async{
    try{
      var url = Uri.parse('https://casa-invita.xyz/api/moderators?limit=10&offset=0');
      var response = await http.get(url,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      print("ALL.Response.code: ${response.statusCode}");
      if(response.statusCode==200){
        var jsn = jsonDecode(response.body);
        return jsn;
      }else{
        return '';
      }
    }catch(e) {
      print('ERROR: $e !!!');
      return '';
    }
  }*/
  
  Future login(String usr, String pwd) async {
    print(usr+' y '+pwd);
    try {
      var response = await http.post(
        Uri.parse(link+'login'),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'username=$usr&password=$pwd',
      );
      print('RPs: ${response.statusCode}:${response.body}');
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return response;
      }else{
        return null;
      }
    } catch (e) {
      print('ERROR: $e !!!');
      return null;
    }
  }

  Future confirm_pwd(String usr, String pwd) async {
    try {
      var response = await http.post(
        Uri.parse(link+'login'),
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'username=$usr&password=$pwd',
      );
      if (response.statusCode == 201) {
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print('ERROR: $e !!!');
      return false;
    }
  }

  Future getUserById(int id, String token)async{
    try{
      //https://casa-invita.xyz/api/rp-users/2
      var url = Uri.parse(link+'$id');
      var response = await http.get(url,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },);
      print('ByID.CODE: '+response.statusCode.toString());
      if (response.statusCode==200){
        return response.body;
      }else{
        return '';
      }
    }catch(e) {
      print('ERROR: $e !!!');
      return '';
    }
  }

  Future updateUser(int id, String token, String field, String value)async{
    print(field+'='+value);
    try{
      var url = Uri.parse(link+'$id');
      var response = await http.patch(url,
        headers: <String, String>{
          'accept': '*/*',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          field: value
        }),
      );
      print('UPDATE.CODE: '+response.statusCode.toString());
      print('UPDATE.BODY: '+response.body.toString());
      if (response.statusCode==204){
        return true;
      }else{
        return false;
      }
    }catch(e) {
      print('ERROR: $e !!!');
      return false;
    }
  }

}
