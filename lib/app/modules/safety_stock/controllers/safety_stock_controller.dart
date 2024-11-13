import 'package:get/get.dart';

class SafetyStockController extends GetxController {

  var selectedButton = 0.obs;

  void changeButton (int index) {
    selectedButton.value = index;
  }
}
