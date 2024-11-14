import 'package:construx_beta/app/modules/inventory_freeze/controllers/inventory_freeze_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class InventoryFreezeView extends GetView<InventoryFreezeController> {
  const InventoryFreezeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Warehouse Working",
      menuSubName: "Inventory Freeze",
      child: const Center(
        child: Text(
          'InventoryFreezeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
