import 'package:aduan/app/modules/Admin/pelaporan_admin/views/pelaporan_admin_view.dart';
import 'package:aduan/app/modules/Admin/persetujuan_admin/views/persetujuan_admin_view.dart';
import 'package:aduan/app/modules/Admin/profil_admin/views/profil_admin_view.dart';
import 'package:get/get.dart';

class NavbarAdminController extends GetxController {
  var selectedIndex = 0.obs;

  final views = [
    const PelaporanAdminView(),
    const PersetujuanAdminView(),
    ProfilAdminView(),
  ];
}
