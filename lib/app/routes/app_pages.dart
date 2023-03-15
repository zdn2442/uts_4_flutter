import 'package:get/get.dart';

import '../modules/add_siswa/bindings/add_siswa_binding.dart';
import '../modules/add_siswa/views/add_siswa_view.dart';
import '../modules/edit_siswa/bindings/edit_siswa_binding.dart';
import '../modules/edit_siswa/views/edit_siswa_view.dart';
import '../modules/for_pass/bindings/for_pass_binding.dart';
import '../modules/for_pass/views/for_pass_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/phone_login/bindings/phone_login_binding.dart';
import '../modules/phone_login/views/phone_login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verify/bindings/verify_binding.dart';
import '../modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_LOGIN,
      page: () => PhoneLoginView(),
      binding: PhoneLoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SISWA,
      page: () => EditSiswaView(),
      binding: EditSiswaBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SISWA,
      page: () => AddSiswaView(),
      binding: AddSiswaBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.FOR_PASS,
      page: () => ForPassView(),
      binding: ForPassBinding(),
    ),
  ];
}
