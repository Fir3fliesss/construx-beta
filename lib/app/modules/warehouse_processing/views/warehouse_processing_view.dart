import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/warehouse_processing_controller.dart';

class WarehouseProcessingView extends GetView<WarehouseProcessingController> {
  const WarehouseProcessingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WarehouseProcessingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WarehouseProcessingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
