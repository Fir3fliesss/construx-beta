import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/commodity_management_controller.dart';

class CommodityManagementView extends GetView<CommodityManagementController> {
  const CommodityManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommodityManagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CommodityManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
