import 'package:get/get.dart';

import '../controllers/onboarding3_controller.dart';

class Onboarding3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Onboarding3Controller>(
      () => Onboarding3Controller(),
    );
  }
}
