import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color(0xff0096FF),                                                                                                                
      body: Center(
        child: Text(
          'Pembayaran SPP',
          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
