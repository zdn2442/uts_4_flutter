import 'package:get/get.dart';

import 'package:uts_4_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:uts_4_flutter/app/modules/home/views/home_view.dart';
import 'package:uts_4_flutter/app/modules/login/bindings/login_binding.dart';
import 'package:uts_4_flutter/app/modules/login/views/login_view.dart';
import 'package:uts_4_flutter/app/modules/otp/bindings/otp_binding.dart';
import 'package:uts_4_flutter/app/modules/otp/views/otp_view.dart';
import 'package:uts_4_flutter/app/modules/phone_login/bindings/phone_login_binding.dart';
import 'package:uts_4_flutter/app/modules/phone_login/views/phone_login_view.dart';
import 'package:uts_4_flutter/app/modules/register/bindings/register_binding.dart';
import 'package:uts_4_flutter/app/modules/register/views/register_view.dart';
import 'package:uts_4_flutter/app/modules/splash/bindings/splash_binding.dart';
import 'package:uts_4_flutter/app/modules/splash/views/splash_view.dart';

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
  ];
}
