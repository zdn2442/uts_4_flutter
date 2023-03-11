import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  startSplashView() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.toNamed(Routes.LOGIN);
    });
  
  }
  final count = 0.obs;
  @override
  void onInit() {
    startSplashView();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
