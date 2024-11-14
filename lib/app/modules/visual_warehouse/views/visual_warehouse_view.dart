import 'package:construx_beta/app/modules/visual_warehouse/controllers/visual_warehouse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class VisualWarehouseView extends GetView<VisualWarehouseController> {
  const VisualWarehouseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(menuItem: SidemenuDashboard(),
        menuName: "Warehouse Working",
        menuSubName: "Visual Warehouse",
        child: const Center(
            child: Text(
          'VisualWarehouseView is working',
          style: TextStyle(fontSize: 20),
        )));
  }
}
