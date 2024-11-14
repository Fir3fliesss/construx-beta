import 'package:get/get.dart';

import '../controllers/inventory_freeze_controller.dart';

class InventoryFreezeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryFreezeController>(
      () => InventoryFreezeController(),
    );
  }
}
