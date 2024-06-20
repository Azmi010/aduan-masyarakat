import 'package:aduan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/akun_user_controller.dart';

class AkunUserView extends GetView<AkunUserController> {
  @override
  final AkunUserController controller = Get.put(AkunUserController());
  AkunUserView({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  '${SpUtil.getString("username")}',
                  style: const TextStyle(
                    color: Color.fromRGBO(29, 53, 87, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    dataProfile("Email", '${SpUtil.getString("email")}' , context),
                    dataProfile("Phone Number", '${SpUtil.getString("phone_number")}', context),
                    dataProfile("Address", '${SpUtil.getString("address")}', context),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.EDIT_AKUN_USER);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromRGBO(69, 123, 157, 1),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
                      fixedSize: const Size(110, 40),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    
    );
  }
  Widget dataProfile(String nama, String data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(nama, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * 0.86,
          decoration: BoxDecoration(border: Border.all(width: 2, color: const Color.fromRGBO(29, 53, 87, 1)), borderRadius: BorderRadius.circular(12)),
          child: Text(data, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
