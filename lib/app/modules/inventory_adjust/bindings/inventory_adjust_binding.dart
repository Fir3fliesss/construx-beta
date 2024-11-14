import 'package:get/get.dart';

import '../controllers/inventory_adjust_controller.dart';

class InventoryAdjustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryAdjustController>(
      () => InventoryAdjustController(),
    );
  }
}
