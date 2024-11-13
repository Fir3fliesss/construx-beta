import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/safety_stock/controllers/safety_stock_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';

  final SafetyStockController controller = Get.find();
  // Tab button builder
  Widget buildTabButton(int index, String text, IconData icon, String routeName) {
    return Obx(() {
      return SizedBox(
        width: 200,
        child: ElevatedButton.icon(
          onPressed: () {
            controller.changeButton(index);
            Get.toNamed(routeName); // Navigate to the specified route
          },
          icon: Icon(icon),
          label: Text(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: controller.selectedButton.value == index ? AppColors.hijau : Colors.white,
            foregroundColor: controller.selectedButton.value == index ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
      );
    });
  }
