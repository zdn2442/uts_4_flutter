import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditSiswaController extends GetxController {
  //TODO: Implement EditSiswaController
 final tulisan = "Edit link gambar".obs;
  TextEditingController gambar = TextEditingController(),
                        nama = TextEditingController(),
                        nisn = TextEditingController(),
                        tanggalLahir = TextEditingController(),
                        tempatLahir = TextEditingController(),
                        alamat = TextEditingController();

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
