import 'package:get/get.dart';

class StockManagementController extends GetxController {
  var selectedButton = 0.obs;

  void changeButton (int index) {
    selectedButton.value = index;
  }
}
