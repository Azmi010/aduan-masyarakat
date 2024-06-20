import 'dart:convert';
import 'package:aduan/app/data/login_provider.dart';
import 'package:aduan/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  TextEditingController emailtxt = TextEditingController(text: 'dev@gmail.com');
  TextEditingController passwordtxt = TextEditingController(text: 'dev123');

  void auth() {
    String email = emailtxt.text;
    String password = passwordtxt.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Gagal", "Pastikan email dan password tidak kosong");
    } else {
      var data = {
        "email": email,
        "password": password,
      };

      LoginProvider().auth(data).then((response) {
        if (kDebugMode) {
          print("Response Status Code: ${response.statusCode}");
        }
        if (kDebugMode) {
          print("Response Body: ${response.body}");
        }

        if (response.statusCode == 200) {
          try {
            var responseBody = jsonDecode(response.body);
            var accessToken = responseBody['access_token'];
            var tokenType = responseBody['token_type'];
            var user = responseBody['user'];

            SpUtil.putString('access_token', accessToken);
            SpUtil.putString('token_type', tokenType);
            SpUtil.putInt('id', user['id']);
            SpUtil.putString('username', user['username']);
            SpUtil.putString('email', user['email']);
            SpUtil.putString('phone_number', user['phone_number']);
            SpUtil.putString('address', user['address']);
            SpUtil.putString('image', user['image']);
            SpUtil.putString('role', user['role']);

            if (user['role'] == 'admin') {
              Get.snackbar("Berhasil", "Login berhasil");
              Get.offAllNamed(Routes.NAVBAR_ADMIN);
            } else {
              Get.snackbar("Berhasil", "Login berhasil");
              Get.offAllNamed(Routes.HOME);
            }
          } catch (e) {
            if (kDebugMode) {
              print("Error parsing JSON: $e");
            }
            Get.snackbar("Gagal", "Terjadi kesalahan saat memproses data");
          }
        } else {
          Get.snackbar("Gagal", "Login Gagal: ${response.body}");
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("Request error: $error");
        }
        Get.snackbar("Gagal", "Terjadi kesalahan: $error");
      });
    }
  }
}
