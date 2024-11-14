import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/inventory_take_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class InventoryTakeView extends GetView<InventoryTakeController> {
  const InventoryTakeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
        menuItem: SidemenuDashboard(),
        menuName: "Warehouse Working",
        menuSubName: "Inventory Take",
        child: const Center(
            child: Text(
          'InventoryTakeView is working',
          style: TextStyle(fontSize: 20),
        )));
  }
}
