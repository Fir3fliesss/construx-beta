import 'package:get/get.dart';

class ReceivingManagementController extends GetxController {
  
  var selectedButton = 0.obs;

  void changeButton (int index) {
    selectedButton.value = index;
  }

  

  

}
