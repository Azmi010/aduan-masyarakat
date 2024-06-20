import 'package:get/get.dart';

import '../controllers/detail_laporan_admin_controller.dart';

class DetailLaporanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLaporanAdminController>(
      () => DetailLaporanAdminController(),
    );
  }
}
