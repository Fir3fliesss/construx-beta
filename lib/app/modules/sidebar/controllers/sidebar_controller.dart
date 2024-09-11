import 'package:get/get.dart';

class SidebarController extends GetxController {
  // Index dari item list yang dipilih
  var selectedIndex = 0.obs;
  var selectedSubIndex = 0.obs;
  
  // Map untuk track sublist yang expanded atau tidak
  var expandedItems = <int, bool>{}.obs;

  // Function untuk memilih index list
  void selectItem(int index) {
    selectedIndex.value = index;
  }

  void selectSubItem(int index) {
    selectedSubIndex.value = index;
  }

  // Function untuk toggle expand/collapse sublist
  void toggleExpand(int index) {
    if (expandedItems.containsKey(index)) {
      expandedItems[index] = !(expandedItems[index] ?? false);
    } else {
      expandedItems[index] = true;
    }
  }

  // Check apakah sublist terbuka
  bool isExpanded(int index) {
    return expandedItems[index] ?? false;
  }
}
