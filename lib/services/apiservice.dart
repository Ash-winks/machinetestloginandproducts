import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:machinetestloginandproducts/models/products/Data.dart';
import 'package:machinetestloginandproducts/models/products/Respall.dart';
import 'package:machinetestloginandproducts/services/userservice.dart';

import '../models/user/User.dart';

class Apiservice{
  final baseurl='https://freeapi.luminartechnohub.com/';
  final userservice=Userservice();
Future<User?> login({required String email, required String password}) async {
final url=Uri.parse('$baseurl/login');
var header={
  'accept': 'application/json',
  'Content-Type':'application/json'
};
var body=jsonEncode({
  'email':email,
  'password':password
});
try{
  final response=await http.post(url,headers: header,body: body);
  if(response.statusCode>=200&&response.statusCode<=299){
    var json=jsonDecode(response.body);
    var user=User.fromJson(json);
    if(user!=null){
      await userservice.saveuser(user);
    }
    return user;
  }else{
    print('Login failed :${response.statusCode}');
  }
}catch(e){
  print('error${e}');
}
return null;
}
Future<List<Products>?> fetchall() async {
  final url=Uri.parse('$baseurl/products-all/');
  var user= await userservice.getuser();
  if(user!=null){
    final header={
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.access}'
    };
    print(header.toString());
    print(url.toString());
    try{
     final response= await http.get(url,headers: header);
     print('response:${response.body}');
     if(response.statusCode>=200 && response.statusCode<=299){
       var json=jsonDecode(response.body);
       return Respall.fromJson(json).data;
     }
    }catch(e){
      print('error${e}');
    }
  }
}
}