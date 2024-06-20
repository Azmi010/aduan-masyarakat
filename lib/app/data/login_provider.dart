import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:aduan/global.dart';

class LoginProvider extends GetConnect {
  Future<http.Response> auth(Map<String, String> data) async {
    var url = Uri.parse('$baseUrl/api/auth/login');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  } 
}
