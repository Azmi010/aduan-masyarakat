import 'package:get/get.dart';

import '../controllers/semua_laporan_user_controller.dart';

class SemuaLaporanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaLaporanUserController>(
      () => SemuaLaporanUserController(),
    );
  }
}
