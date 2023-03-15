import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_4_flutter/app/routes/app_pages.dart';

import '../controllers/verify_controller.dart';

class VerifyView extends GetView<VerifyController> {
  const VerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VerifyView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'VerifyView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(onPressed: () => Get.toNamed(Routes.LOGIN), child: Text('ke Login'))
        ],
      ),
    );
  }
}
