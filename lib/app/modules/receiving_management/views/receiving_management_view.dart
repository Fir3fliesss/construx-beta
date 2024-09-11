import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:construx_beta/app/modules/appbar/views/appbar_view.dart';
import '../controllers/receiving_management_controller.dart';
import 'package:construx_beta/app/modules/sidebar/views/sidebar_view.dart';

class ReceivingManagementView extends GetView<ReceivingManagementController> {
  const ReceivingManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                AppbarView(),
                const Center(
                  child: Text(
                    'ReceivingManagementView is working',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
