import 'package:get/get.dart';

import '../controllers/homepage_user_controller.dart';

class HomepageUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageUserController>(
      () => HomepageUserController(),
    );
  }
}
