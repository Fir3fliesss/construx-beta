import 'package:get/get.dart';

import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';

class WarehouseSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseSettingsController>(
      () => WarehouseSettingsController(),
    );
  }
}
