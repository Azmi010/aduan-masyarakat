import 'package:get/get.dart';

import '../modules/Admin/detail_laporan_admin/bindings/detail_laporan_admin_binding.dart';
import '../modules/Admin/detail_laporan_admin/views/detail_laporan_admin_view.dart';
import '../modules/Admin/navbar_admin/bindings/navbar_admin_binding.dart';
import '../modules/Admin/navbar_admin/views/navbar_admin_view.dart';
import '../modules/Admin/pelaporan_admin/bindings/pelaporan_admin_binding.dart';
import '../modules/Admin/pelaporan_admin/views/pelaporan_admin_view.dart';
import '../modules/Admin/persetujuan_admin/bindings/persetujuan_admin_binding.dart';
import '../modules/Admin/persetujuan_admin/views/persetujuan_admin_view.dart';
import '../modules/Admin/profil_admin/bindings/profil_admin_binding.dart';
import '../modules/Admin/profil_admin/views/profil_admin_view.dart';
import '../modules/Auth/login/bindings/login_binding.dart';
import '../modules/Auth/login/views/login_view.dart';
import '../modules/Auth/recovery_password/bindings/recovery_password_binding.dart';
import '../modules/Auth/recovery_password/views/recovery_password_view.dart';
import '../modules/Auth/register/bindings/register_binding.dart';
import '../modules/Auth/register/views/register_view.dart';
import '../modules/Auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/Auth/reset_password/views/reset_password_view.dart';
import '../modules/Splashes/onboarding1/bindings/onboarding1_binding.dart';
import '../modules/Splashes/onboarding1/views/onboarding1_view.dart';
import '../modules/Splashes/onboarding2/bindings/onboarding2_binding.dart';
import '../modules/Splashes/onboarding2/views/onboarding2_view.dart';
import '../modules/Splashes/onboarding3/bindings/onboarding3_binding.dart';
import '../modules/Splashes/onboarding3/views/onboarding3_view.dart';
import '../modules/Splashes/splash/bindings/splash_binding.dart';
import '../modules/Splashes/splash/views/splash_view.dart';
import '../modules/Splashes/tap_geser/bindings/tap_geser_binding.dart';
import '../modules/Splashes/tap_geser/views/tap_geser_view.dart';
import '../modules/User/akun_user/bindings/akun_user_binding.dart';
import '../modules/User/akun_user/views/akun_user_view.dart';
import '../modules/User/edit_akun_user/bindings/edit_akun_user_binding.dart';
import '../modules/User/edit_akun_user/views/edit_akun_user_view.dart';
import '../modules/User/home/bindings/home_binding.dart';
import '../modules/User/home/views/home_view.dart';
import '../modules/User/homepage_user/bindings/homepage_user_binding.dart';
import '../modules/User/homepage_user/views/homepage_user_view.dart';
import '../modules/User/pelaporan_user/bindings/pelaporan_user_binding.dart';
import '../modules/User/pelaporan_user/views/pelaporan_user_view.dart';
import '../modules/User/semua_laporan_user/bindings/semua_laporan_user_binding.dart';
import '../modules/User/semua_laporan_user/views/semua_laporan_user_view.dart';
import '../modules/Admin/accept_laporan_admin/bindings/accept_laporan_admin_binding.dart';
import '../modules/Admin/accept_laporan_admin/views/accept_laporan_admin_view.dart';
import '../modules/Admin/reject_laporan_admin/bindings/reject_laporan_admin_binding.dart';
import '../modules/Admin/reject_laporan_admin/views/reject_laporan_admin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.PELAPORAN_ADMIN,
      page: () => const PelaporanAdminView(),
      binding: PelaporanAdminBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_USER,
      page: () => const HomepageUserView(),
      binding: HomepageUserBinding(),
    ),
    GetPage(
      name: _Paths.PELAPORAN_USER,
      page: () => const PelaporanUserView(),
      binding: PelaporanUserBinding(),
    ),
    GetPage(
      name: _Paths.SEMUA_LAPORAN_USER,
      page: () => const SemuaLaporanUserView(),
      binding: SemuaLaporanUserBinding(),
    ),
    GetPage(
      name: _Paths.AKUN_USER,
      page: () => AkunUserView(),
      binding: AkunUserBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_AKUN_USER,
      page: () => EditAkunUserView(),
      binding: EditAkunUserBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_ADMIN,
      page: () => ProfilAdminView(),
      binding: ProfilAdminBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING1,
      page: () => const Onboarding1View(),
      binding: Onboarding1Binding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING2,
      page: () => const Onboarding2View(),
      binding: Onboarding2Binding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING3,
      page: () => const Onboarding3View(),
      binding: Onboarding3Binding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAP_GESER,
      page: () => TapGeserView(),
      binding: TapGeserBinding(),
    ),
    GetPage(
      name: _Paths.RECOVERY_PASSWORD,
      page: () => const RecoveryPasswordView(),
      binding: RecoveryPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAPORAN_ADMIN,
      page: () => const DetailLaporanAdminView(),
      binding: DetailLaporanAdminBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR_ADMIN,
      page: () => const NavbarAdminView(),
      binding: NavbarAdminBinding(),
    ),
    GetPage(
      name: _Paths.PERSETUJUAN_ADMIN,
      page: () => const PersetujuanAdminView(),
      binding: PersetujuanAdminBinding(),
    ),
    GetPage(
      name: _Paths.ACCEPT_LAPORAN_ADMIN,
      page: () => const AcceptLaporanAdminView(),
      binding: AcceptLaporanAdminBinding(),
    ),
    GetPage(
      name: _Paths.REJECT_LAPORAN_ADMIN,
      page: () => const RejectLaporanAdminView(),
      binding: RejectLaporanAdminBinding(),
    ),
  ];
}
