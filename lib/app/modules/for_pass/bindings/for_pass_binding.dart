import 'package:get/get.dart';

import '../controllers/for_pass_controller.dart';

class ForPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForPassController>(
      () => ForPassController(),
    );
  }
}
