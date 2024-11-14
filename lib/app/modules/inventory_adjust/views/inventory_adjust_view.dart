import 'package:construx_beta/app/modules/inventory_adjust/controllers/inventory_adjust_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class InventoryAdjustView extends GetView<InventoryAdjustController> {
  const InventoryAdjustView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
        menuItem: SidemenuDashboard(),
        menuName: "Warehouse Working",
        menuSubName: "Inventory Adjust",
        child: const Center(
            child: Text(
          'InventoryAdjustView is working',
          style: TextStyle(fontSize: 20),
        )));
  }
}
