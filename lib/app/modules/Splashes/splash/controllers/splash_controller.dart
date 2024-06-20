import 'dart:async';

import 'package:aduan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    navigateToOnboarding();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.TAP_GESER);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
