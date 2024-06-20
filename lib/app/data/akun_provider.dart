import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:aduan/global.dart';

class AkunProvider extends GetConnect {
  Future<http.Response> updateAkun(Map<String, String> data) async {
    var url = Uri.parse('$baseUrl/api/auth/update'); 
    String? token = SpUtil.getString('access_token');

    if (token == null) {
      return http.Response('Token is missing', 401);
    }

    var response = await http.put(
      url, 
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    return response;
  }
}
