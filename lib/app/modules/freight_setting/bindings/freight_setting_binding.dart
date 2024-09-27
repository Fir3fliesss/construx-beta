import 'package:get/get.dart';

import '../controllers/freight_setting_controller.dart';

class FreightSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreightSettingController>(
      () => FreightSettingController(),
    );
  }
}
