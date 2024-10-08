import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/receiving_management_controller.dart';

class ReceivingManagementView extends GetView<ReceivingManagementController> {
  const ReceivingManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
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
