import 'package:get/get.dart';

import '../controllers/company_information_controller.dart';

class CompanyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyInformationController>(
      () => CompanyInformationController(),
    );
  }
}
