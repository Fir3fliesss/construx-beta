import 'package:get/get.dart';

import '../controllers/inventory_move_controller.dart';

class InventoryMoveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryMoveController>(
      () => InventoryMoveController(),
    );
  }
}
