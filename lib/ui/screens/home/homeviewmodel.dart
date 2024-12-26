import 'dart:ui';

import 'package:machinetestloginandproducts/app/app.locator.dart';
import 'package:machinetestloginandproducts/models/products/Data.dart';
import 'package:machinetestloginandproducts/services/apiservice.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
 final apiservice=locator<Apiservice>();
 List<Products>?plist=[];
 Future<void> getproducts() async {
   plist =await apiservice.fetchall();
   notifyListeners();
 }
  List<String>imglist=[
    'assets/images/sneaker.jpg',
    'assets/images/speaker.jpg',
 ];
}