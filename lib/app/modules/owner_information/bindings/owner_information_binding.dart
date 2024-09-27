import 'package:get/get.dart';

import '../controllers/owner_information_controller.dart';

class OwnerInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnerInformationController>(
      () => OwnerInformationController(),
    );
  }
}
