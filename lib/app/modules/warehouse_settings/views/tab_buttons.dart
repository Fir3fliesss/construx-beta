import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';

class TabButtons extends StatelessWidget {
  final WarehouseSettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          buildTabButton(0, "Warehouse Setting", Icons.settings),
          SizedBox(width: 16.0),
          buildTabButton(1, "Reservoir Setting", Icons.water),
          SizedBox(width: 16.0),
          buildTabButton(2, "Location Setting", Icons.location_on),
        ],
      ),
    );
  }

  // Tab button builder
  Widget buildTabButton(int index, String text, IconData icon) {
    return Obx(() {
      return ElevatedButton.icon(
        onPressed: () {
          controller.changeButton(index);
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.selectedButton.value == index ? AppColors.hijau : Colors.white,
          foregroundColor: controller.selectedButton.value == index ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      );
    });
  }
}
