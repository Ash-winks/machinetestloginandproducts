import 'dart:async';

import 'package:machinetestloginandproducts/app/app.locator.dart';
import 'package:machinetestloginandproducts/app/app.router.dart';
import 'package:machinetestloginandproducts/app/utils.dart';
import 'package:machinetestloginandproducts/services/userservice.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel{
  final userservice =locator<Userservice>();
Future<void> timer() async {
  var user= await userservice.getuser();
  Timer(Duration(seconds: 1),() async {
    if(await userservice.islogin()){
      navigationService.pushNamedAndRemoveUntil(Routes.homeview);
    }else{
      navigationService.pushNamedAndRemoveUntil(Routes.loginview);
    }
  });
}
}