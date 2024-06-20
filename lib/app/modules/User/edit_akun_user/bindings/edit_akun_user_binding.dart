import 'package:get/get.dart';

import '../controllers/edit_akun_user_controller.dart';

class EditAkunUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAkunUserController>(
      () => EditAkunUserController(),
    );
  }
}
