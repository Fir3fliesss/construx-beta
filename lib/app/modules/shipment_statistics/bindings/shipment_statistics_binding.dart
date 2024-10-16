import 'package:get/get.dart';

import '../controllers/shipment_statistics_controller.dart';

class ShipmentStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentStatisticsController>(
      () => ShipmentStatisticsController(),
    );
  }
}
