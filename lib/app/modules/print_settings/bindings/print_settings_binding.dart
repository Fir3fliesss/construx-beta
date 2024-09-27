import 'package:get/get.dart';

import '../controllers/print_settings_controller.dart';

class PrintSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintSettingsController>(
      () => PrintSettingsController(),
    );
  }
}
