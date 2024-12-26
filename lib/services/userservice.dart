import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/User.dart';

class Userservice {
  static const String _userkey = 'user_data';
  Future<void> saveuser(User user) async {
    print('calling');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_userkey, jsonEncode(user.toJson()));
    print('saved${jsonEncode(user.toJson())}');
  }
  Future<User?> getuser() async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var data=await sharedPreferences.getString(_userkey);
    if(data==null){
      return null;
    }else{
      var user=await User.fromJson(jsonDecode(data));
      return user;
    }
  }
  Future<bool> islogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool status=sharedPreferences.containsKey(_userkey);
    print('login${status}');
    return status;
  }
}
