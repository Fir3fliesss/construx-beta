import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_management_controller.dart';

class UserManagementView extends GetView<UserManagementController> {
  const UserManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserManagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
