import 'package:construx_beta/app/modules/sidebar/controllers/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appbar/views/appbar_view.dart';
import 'sidebar/views/sidebar_view.dart';
import 'sidebar/views/loading_view.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final LoadingController loadingController;

  const MainLayout({
    super.key, 
    required this.child, 
    required this.loadingController
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                const AppbarView(), // AppBarView sekarang menjadi bagian dari Column
                Expanded(
                  child: Obx(() => loadingController.isLoading.value 
                    ? const LoadingWidget() 
                    : child
                  ),
                ), 
              ],
            ),
          ), 
        ],
      ),
    );
  }
}