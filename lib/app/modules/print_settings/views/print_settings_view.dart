import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/print_settings_controller.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class PrintSettingsView extends GetView<PrintSettingsController> {
  const PrintSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(menuItem: SidemenuDashboard(), menuName: "Basic Settings", menuSubName: "Print Settings",
    child:  Center(
        child: Text(
          'PrintSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );  }
}
