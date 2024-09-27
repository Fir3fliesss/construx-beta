import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/permission_settings_controller.dart';

class PermissionSettingsView extends GetView<PermissionSettingsController> {
  const PermissionSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PermissionSettingsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PermissionSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
