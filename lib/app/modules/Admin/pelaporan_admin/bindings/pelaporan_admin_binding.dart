import 'package:get/get.dart';

import '../controllers/pelaporan_admin_controller.dart';

class PelaporanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelaporanAdminController>(
      () => PelaporanAdminController(),
    );
  }
}
