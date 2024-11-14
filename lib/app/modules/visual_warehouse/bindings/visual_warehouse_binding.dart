import 'package:get/get.dart';

import '../controllers/visual_warehouse_controller.dart';

class VisualWarehouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisualWarehouseController>(
      () => VisualWarehouseController(),
    );
  }
}
