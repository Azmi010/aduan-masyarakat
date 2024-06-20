import 'package:get/get.dart';

import '../controllers/profil_admin_controller.dart';

class ProfilAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilAdminController>(
      () => ProfilAdminController(),
    );
  }
}
