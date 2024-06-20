import 'package:get/get.dart';

import '../controllers/tap_geser_controller.dart';

class TapGeserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TapGeserController>(
      () => TapGeserController(),
    );
  }
}
