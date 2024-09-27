import 'package:get/get.dart';

import '../controllers/permission_settings_controller.dart';

class PermissionSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionSettingsController>(
      () => PermissionSettingsController(),
    );
  }
}
