import 'package:get/get.dart';

import '../controllers/reject_laporan_admin_controller.dart';

class RejectLaporanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RejectLaporanAdminController>(
      () => RejectLaporanAdminController(),
    );
  }
}
