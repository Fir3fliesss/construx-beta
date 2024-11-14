import 'package:construx_beta/app/modules/delivery_management/controllers/delivery_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class DeliveryManagementView extends GetView<DeliveryManagementController> {
  const DeliveryManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(menuItem: SidemenuDashboard(),
        menuName: "Warehouse Working",
        menuSubName: "Delivery Management",
        child: const Center(
            child: Text(
          'DeliveryManagementView is working',
          style: TextStyle(fontSize: 20),
        )));
  }
}
