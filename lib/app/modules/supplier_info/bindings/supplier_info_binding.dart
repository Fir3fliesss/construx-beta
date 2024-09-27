import 'package:get/get.dart';

import '../controllers/supplier_info_controller.dart';

class SupplierInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierInfoController>(
      () => SupplierInfoController(),
    );
  }
}
