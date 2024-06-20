import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_user_controller.dart';

class HomepageUserView extends GetView<HomepageUserController> {
  const HomepageUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 125),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "J-CARE",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins-ExtraBold',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D3557),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Selamat datang para pengguna, gunakan hak anda untuk melaporkan kerusakan fasilitas di sekitar anda!",
                    style: TextStyle(
                      color: Color(0xFF1D3557),
                      fontFamily: 'Poppins-Bold',
                      fontSize: 24
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
