import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_info_controller.dart';

class CustomerInfoView extends GetView<CustomerInfoController> {
  const CustomerInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerInfoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CustomerInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
