import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:aduan/global.dart';

class LogoutProvider extends GetConnect {
  Future<http.Response> out(String token) async {
    var url = Uri.parse('$baseUrl/api/auth/logout');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token', 
      },
    );
    return response;
  }
}
