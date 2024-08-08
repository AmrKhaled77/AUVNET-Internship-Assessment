import 'package:flutter/foundation.dart';

class UserModel{


  bool? status;
  String? message;

  dataModel? data;

  UserModel({
    this.data,
    this.message,this.status
});

  factory UserModel.fromjson(Map<String, dynamic> json){

    return UserModel(
    data:json['data']!=null? dataModel.fromjson(json['data']):dataModel(
      token: '',
      points: 22,
      phone: '',
       name: '',
      image: '',
      id: 2,
      email:'' ,

    ),

    message: json['message'],
    status: json['status'],
    );
  }

}


class dataModel{

int? id;
String ? name;
String ? email;
String ? phone;
String ? image;
String ? token;
int? points;



dataModel({

    this.email,
this.name,this.id,this.image,this.phone,this.points,this.token});


factory dataModel.fromjson(Map<String, dynamic> json){
  return dataModel(

    email: json['email'],
    id:    json['id'] ,
    image: json['image'],
    name: json['name'],
    phone: json['phone'],
    points: json['points'],
    token: json['token'],
  );


}

}