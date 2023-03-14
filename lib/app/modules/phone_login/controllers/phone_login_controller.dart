import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController {
  //TODO: Implement PhoneLoginController

  final count = 0.obs;
  TextEditingController phone =TextEditingController();
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
