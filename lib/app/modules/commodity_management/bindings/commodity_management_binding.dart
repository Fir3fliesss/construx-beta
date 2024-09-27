import 'package:get/get.dart';

import '../controllers/commodity_management_controller.dart';

class CommodityManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommodityManagementController>(
      () => CommodityManagementController(),
    );
  }
}
