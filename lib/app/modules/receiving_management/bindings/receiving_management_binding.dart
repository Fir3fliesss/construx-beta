import 'package:get/get.dart';

import '../controllers/receiving_management_controller.dart';

class ReceivingManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivingManagementController>(
      () => ReceivingManagementController(),
    );
  }
}
