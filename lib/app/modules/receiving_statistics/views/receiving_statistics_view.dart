import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/receiving_statistics_controller.dart';

class ReceivingStatisticsView extends GetView<ReceivingStatisticsController> {
  const ReceivingStatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReceivingStatisticsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReceivingStatisticsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
