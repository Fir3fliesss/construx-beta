import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/owner_information_controller.dart';

class OwnerInformationView extends GetView<OwnerInformationController> {
  const OwnerInformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OwnerInformationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OwnerInformationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
