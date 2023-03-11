import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
final hiddenPassword = true.obs;
  changeEye() => hiddenPassword.toggle();

  final count = 0.obs;

  TextEditingController email = TextEditingController(),
      password = TextEditingController();
  @override
  void onInit() {
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
