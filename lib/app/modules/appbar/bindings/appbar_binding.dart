import 'package:get/get.dart';

import '../controllers/appbar_controller.dart';

class AppbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppbarController>(
      () => AppbarController(),
    );
  }
}
