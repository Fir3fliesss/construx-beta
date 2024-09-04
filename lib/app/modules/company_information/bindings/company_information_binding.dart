import 'package:get/get.dart';

import 'package:construx_beta/app/modules/company_information/controllers/company_information_controller.dart';


class CompanyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyInformationController>(() => CompanyInformationController());
  }
}
