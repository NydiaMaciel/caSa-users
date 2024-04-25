import 'package:http/http.dart' as http;
import 'dart:convert';
//             https://casa-invita.xyz/api/rp-users
String link = 'https://casa-invita.xyz/api/rp-users/';

class Services{
  
  Future create(String name, String email, String pswd, String phone)async{
    print('NAME:$name');
    try{
      var url = Uri.parse('https://casa-invita.xyz/api/rp-users');
      var response = await http.post(url,
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
            "user_name": name,
            "email": email,
            "password": pswd,
            "phone_number": phone
        }),
      );
      print('register:'+response.statusCode.toString());
      if(response.statusCode==201){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print('ERROR: $e !!!');
      return false;
    }
  }
  
  Future login(String usr, String pwd) async {
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
