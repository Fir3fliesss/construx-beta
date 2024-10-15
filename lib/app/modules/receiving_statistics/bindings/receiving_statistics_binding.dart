import 'package:get/get.dart';

import '../controllers/receiving_statistics_controller.dart';

class ReceivingStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivingStatisticsController>(
      () => ReceivingStatisticsController(),
    );
  }
}
