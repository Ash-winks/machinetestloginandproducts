import 'Data.dart';
import 'dart:convert';

Respall respallFromJson(String str) => Respall.fromJson(json.decode(str));
String respallToJson(Respall data) => json.encode(data.toJson());
class Respall {
  Respall({
      this.msg, 
      this.data,});

  Respall.fromJson(dynamic json) {
    msg = json['Msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Products.fromJson(v));
      });
    }
  }
  String? msg;
  List<Products>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}