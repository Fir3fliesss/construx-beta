import 'package:get/get.dart';

import '../controllers/inventory_take_controller.dart';

class InventoryTakeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryTakeController>(
      () => InventoryTakeController(),
    );
  }
}
