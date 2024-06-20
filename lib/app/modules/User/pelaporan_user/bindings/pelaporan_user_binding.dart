import 'package:get/get.dart';

import '../controllers/pelaporan_user_controller.dart';

class PelaporanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelaporanUserController>(
      () => PelaporanUserController(),
    );
  }
}
