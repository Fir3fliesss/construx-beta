import 'package:get/get.dart';

import '../controllers/warehouse_processing_controller.dart';

class WarehouseProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarehouseProcessingController>(
      () => WarehouseProcessingController(),
    );
  }
}
