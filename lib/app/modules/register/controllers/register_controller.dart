import 'package:aduan/app/data/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
    TextEditingController usernametxt = TextEditingController(text: 'coba');
    TextEditingController emailtxt = TextEditingController(text: 'coba@gmail.com');
    TextEditingController passwordtxt = TextEditingController(text: 'coba123');

  void reg() {
    String username = usernametxt.text;
    String email = emailtxt.text;
    String password = passwordtxt.text;

    if (email.isEmpty || password.isEmpty) {
          Get.snackbar("Gagal", "Isi dulu bang");
    } else {
      var data = {
        "username": username,
        "email": email,
        "password": password,
        "role": "user",
        "image": 'apa',
      };
      
      RegisterProvider().reg(data).then((value) {
        if (value.statusCode == 200){
          //  var responseData = value.body;
          // var username = responseData['username'];
          // var email = responseData['email'];
          // var password = responseData['password'];
          Get.snackbar("Berhasil", "Pendaftaran");
        } else {
          Get.snackbar("Gagal", "Daftar gagal");
        }
      });
    }
  }
}
