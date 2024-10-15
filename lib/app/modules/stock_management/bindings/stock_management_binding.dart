import 'package:get/get.dart';

import '../controllers/stock_management_controller.dart';

class StockManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockManagementController>(
      () => StockManagementController(),
    );
  }
}
