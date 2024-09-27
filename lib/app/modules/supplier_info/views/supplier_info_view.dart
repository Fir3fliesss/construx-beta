import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/supplier_info_controller.dart';

class SupplierInfoView extends GetView<SupplierInfoController> {
  const SupplierInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupplierInfoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupplierInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
