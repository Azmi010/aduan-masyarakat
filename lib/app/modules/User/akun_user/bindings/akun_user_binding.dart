import 'package:get/get.dart';

import '../controllers/akun_user_controller.dart';

class AkunUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkunUserController>(
      () => AkunUserController(),
    );
  }
}
