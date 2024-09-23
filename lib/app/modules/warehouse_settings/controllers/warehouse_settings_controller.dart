import 'package:get/get.dart';

class WarehouseSettingsController extends GetxController {
  // This will store the selected button index
  var selectedButton = 0.obs;

  // Function to change the selected button
  void changeButton(int index) {
    selectedButton.value = index;
  }
}
