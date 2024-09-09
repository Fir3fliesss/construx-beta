import 'package:get/get.dart';

import '../controllers/commodity_category_controller.dart';

class CommodityCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommodityCategoryController>(
      () => CommodityCategoryController(),
    );
  }
}
