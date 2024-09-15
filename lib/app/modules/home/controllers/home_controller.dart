import 'package:get/get.dart';

import '../../sidebar/controllers/loading_controller.dart';

class HomeController extends GetxController {
  final LoadingController loadingController = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadingController.triggerLoading();
  }
}