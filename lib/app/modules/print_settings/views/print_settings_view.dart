import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/print_settings_controller.dart';

class PrintSettingsView extends GetView<PrintSettingsController> {
  const PrintSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrintSettingsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrintSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
