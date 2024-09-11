import 'package:get/get.dart';
import 'package:construx_beta/app/modules/sidebar/controllers/sidebar_controller.dart';

class SidebarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SidebarController>(SidebarController());
  }
}
