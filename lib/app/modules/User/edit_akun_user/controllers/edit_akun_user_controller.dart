import 'package:aduan/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../data/akun_provider.dart';

class EditAkunUserController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final AkunProvider akunProvider = AkunProvider();

  void updateAkun() async {
    try {
      String username = usernameController.text;
      String phoneNumber = phoneNumberController.text;
      String address = addressController.text;

      Map<String, String> requestBody = {
        'username': username,
        'phone_number': phoneNumber,
        'address': address,
      };

      final response = await akunProvider.updateAkun(requestBody);

      if (response.statusCode == 200) {
        SpUtil.putString('username', username);
        SpUtil.putString('phone_number', phoneNumber);
        SpUtil.putString('address', address);

        Get.snackbar('Success', 'Data updated successfully');
        Get.toNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'Failed to update data: ${response.statusCode}');
        if (kDebugMode) {
          print('Error Response: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
