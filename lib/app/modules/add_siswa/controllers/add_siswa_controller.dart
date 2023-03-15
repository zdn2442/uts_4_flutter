import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddSiswaController extends GetxController {
  //TODO: Implement AddSiswaController
  final tulisan = "Masukan link gambar".obs;
  TextEditingController nama = TextEditingController(),
                        nisn = TextEditingController(),
                        tanggalLahir = TextEditingController(),
                        tempatLahir = TextEditingController(),
                        alamat = TextEditingController(),
                        gambar = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
