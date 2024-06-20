import 'package:get/get.dart';

import '../controllers/accept_laporan_admin_controller.dart';

class AcceptLaporanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcceptLaporanAdminController>(
      () => AcceptLaporanAdminController(),
    );
  }
}
