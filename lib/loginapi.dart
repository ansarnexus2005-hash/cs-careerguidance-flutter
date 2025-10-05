import 'package:carriera/api/registerapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int?lid;
String?userType;
Future<void>LoginView(Username,Password,context)async {
  try{
    Response response = await dio.post(
      '$baseurl/user/loginpageapi',
      data: {"Username":Username,"Password":Password},
    );
    print(response.data);
    int? res=response.statusCode;
    // loginstatus=response.data['status']??'failed';
    if(res==200 || res==201){
      userType=response.data['user_type'];
      lid=response.data['login_id']is int
      ?response.data['login_id']
      : int.tryParse(response.data['login_id'].toString());

      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      //   builder: (context)=>const userhomepage()


      // ), (route)=>false);   
         }
  }
  catch(e){
    print(e);
  }
}