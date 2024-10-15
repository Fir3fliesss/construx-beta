
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/stock_management/controllers/stock_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';

class TabButtons extends StatelessWidget {
  final StockManagementController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          buildTabButton(0, "Stock Location", Icons.warehouse, '/stock-management'),
          SizedBox(width: 16.0),
          buildTabButton(1, "Stock", Icons.storage, '/stock'),
        ],
      ),
    );
  }

  // Tab button builder
Widget buildTabButton(int index, String text, IconData icon, String routeName) {
  return Obx(() {
    return SizedBox(
      width: 200,
      child: ElevatedButton.icon(
        onPressed: () {
          controller.changeButton(index);
          Get.toNamed(routeName); 
        },
        icon: Icon(icon),
         label: Align(
          alignment: Alignment.centerLeft, // Align the text to the left
          child: Text(text),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.selectedButton.value == index ? AppColors.hijau : Colors.white,
          foregroundColor: controller.selectedButton.value == index ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18.0,  horizontal: 24.0), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  });
}

}

