import 'package:get/get.dart';

import '../controllers/safety_stock_controller.dart';

class SafetyStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafetyStockController>(
      () => SafetyStockController(),
    );
  }
}
