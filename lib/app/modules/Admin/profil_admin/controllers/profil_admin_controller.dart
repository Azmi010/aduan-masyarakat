import 'package:aduan/app/data/logout_provider.dart';
import 'package:aduan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';


class ProfilAdminController extends GetxController {
  void logout() async {
    final token = SpUtil.getString('access_token') ?? '';

    if (token.isNotEmpty) {
      final response = await LogoutProvider().out(token);

      if (response.statusCode == 200) {
        SpUtil.clear();
        Get.offAllNamed(Routes.LOGIN);
        print('Berhasil logout dari API');
      } else {
        print('Gagal logout dari API');
      }
    }
  }
}
