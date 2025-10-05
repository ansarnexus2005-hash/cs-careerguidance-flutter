import 'package:carriera/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final baseurl='http://192.168.1.52:5000';
final dio=Dio();
Future<void> registerApi(data,context) async {
  try{
    Response response= await dio.post('$baseurl/UserRequest/api/',data: data);

    print(response);
    if (response.statusCode ==200 || response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          ));
    } else {
      throw Exception('failed to get');
    }
  } catch (e) {
    print(e.toString());
  }
}