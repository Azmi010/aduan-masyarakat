import 'package:get/get.dart';
import 'package:aduan/global.dart';

class RegisterProvider extends GetConnect {
  Future<Response> reg(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post('$baseUrl/api/auth/register', data, headers: myHeader);
  }
}
