import 'package:aduan/app/modules/User/akun_user/views/akun_user_view.dart';
import 'package:aduan/app/modules/User/pelaporan_user/views/pelaporan_user_view.dart';
import 'package:aduan/app/modules/User/semua_laporan_user/views/semua_laporan_user_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  final views = [
    const SemuaLaporanUserView(),
    const PelaporanUserView(),
    AkunUserView(),
  ];
}
