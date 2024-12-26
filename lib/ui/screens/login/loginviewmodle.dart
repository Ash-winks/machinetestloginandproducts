import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetestloginandproducts/app/app.router.dart';
import 'package:machinetestloginandproducts/app/utils.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user/User.dart';
import '../../../services/apiservice.dart';
import '../../../services/userservice.dart';


class LoginViewModel extends BaseViewModel{
 TextEditingController emailc =TextEditingController();
 TextEditingController passc=TextEditingController();
 final formkey=GlobalKey<FormState>();
 final apiservice=Apiservice();
 final userservice=Userservice();
 Future<void> login() async {
  if(formkey.currentState!.validate()){
   User? user=await apiservice.login(email: emailc.text, password:passc.text);
   if(user!=null){
    userservice.saveuser(user);
      navigationService.navigateTo(Routes.homeview);
   }
  }
 }
}