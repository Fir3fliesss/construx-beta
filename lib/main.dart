import 'package:construx_beta/app/modules/sidebar/controllers/loading_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(LoadingController(), permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ConstruX",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
