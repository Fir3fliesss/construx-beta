import 'package:get/get.dart';

import '../controllers/delivery_management_controller.dart';

class DeliveryManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryManagementController>(
      () => DeliveryManagementController(),
    );
  }
}
