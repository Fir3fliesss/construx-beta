
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';

class TabButtons extends StatelessWidget {
  final ReceivingManagementController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Sebar rata antar tombol
        children: [
          Expanded(child: buildTabButton(0, "Notice Of Arrival", Icons.note, '/receiving-management')),
          const SizedBox(width: 8), // Jarak antar tombol agar tidak terlalu menempel
          Expanded(child: buildTabButton(1, "To be Delivered",  Icons.local_shipping, '/to-be-delivered')),
          const SizedBox(width: 8), 
          Expanded(child: buildTabButton(2, "To be Unloaded",Icons.unarchive, '/to-be-unloaded')),
          const SizedBox(width: 8), 
          Expanded(child: buildTabButton(3, "To be Sorted", Icons.sort_outlined, '/to-be-sorted')),
          const SizedBox(width: 8), 
          Expanded(child: buildTabButton(4, "To be Put On The Shelf", Icons.inventory, '/put-on-shelf')),
          const SizedBox(width: 8), 
          Expanded(child: buildTabButton(5, "Receipt Details", Icons.receipt, '/receipt-details')),
        ],
      ),
    );
  }

  // Tab button builder
  Widget buildTabButton(int index, String text, IconData icon, String routeName) {
    return Obx(() {
      return ElevatedButton.icon(
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
      );
    });
  }
}
