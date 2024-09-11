import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:construx_beta/app/modules/sidebar/views/loading_view.dart';

class SidebarController extends GetxController {
  // Index dari item list yang dipilih
  var selectedIndex = 0.obs;
  var selectedSubIndex = (-1).obs;

  // Map untuk melacak apakah sublist sedang expanded atau tidak
  var expandedItems = <int, bool>{}.obs;

  // Fungsi untuk memilih item utama
  void selectItem(int index) {
    // Set selectedIndex ke item yang dipilih
    selectedIndex.value = index;

    // Jika item utama dipilih dan tidak ada sublist, tutup semua sublist
    if (!expandedItems.containsKey(index) || !(expandedItems[index] ?? false)) {
      closeAllSubLists();
    }
  }

  // Fungsi untuk memilih sub item
  void selectSubItem(int index) {
    selectedSubIndex.value = index;
    // Jangan tutup sublist di sini karena kita ingin tetap membukanya saat sublist dipilih
  }

  // Fungsi untuk menutup semua sublist ketika item utama dipilih
  void closeAllSubLists() {
    // Mengatur semua expandedItems menjadi false
    expandedItems.updateAll((key, value) => false);
  }

  // Fungsi untuk toggle expand/collapse sublist
  void toggleExpand(int index) {
    // Jika sudah ada key di dalam map, toggle nilainya
    if (expandedItems.containsKey(index)) {
      expandedItems[index] = !(expandedItems[index] ?? false);
    } else {
      expandedItems[index] = true; // Set true jika belum ada
    }
  }

  // Check apakah sublist terbuka
  bool isExpanded(int index) {
    return expandedItems[index] ?? false;
  }

  // Method untuk delay dan navigasi dengan loading screen
  Future<void> navigateWithDelay(String route) async {
    // Tampilkan layar loading
    // Get.to(() => LoadingWidget());

    // Delay selama 1.5 detik
    await Future.delayed(Duration(milliseconds: 300));

    // Navigasi ke halaman yang diinginkan setelah delay
    Get.toNamed(route);
  }
}
