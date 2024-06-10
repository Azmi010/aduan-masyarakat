import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  Future<Response> reg(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post('http://127.0.0.1:8000/api/auth/register', data, headers: myHeader);
  }
}
