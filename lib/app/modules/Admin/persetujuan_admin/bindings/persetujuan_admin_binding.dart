import 'package:get/get.dart';

import '../controllers/persetujuan_admin_controller.dart';

class PersetujuanAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersetujuanAdminController>(
      () => PersetujuanAdminController(),
    );
  }
}
