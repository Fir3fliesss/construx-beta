import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/freight_setting_controller.dart';

class FreightSettingView extends GetView<FreightSettingController> {
  const FreightSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FreightSettingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FreightSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
