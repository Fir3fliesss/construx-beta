import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import '../../sidebar/views/sidebar_view.dart';
import '../../appbar/views/appbar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const AppbarView(),
                Expanded(
                  child: Container(
                    color: AppColors.background,
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(
                      child: Text('ConstruX', style: TextStyle(fontSize: 24.0)),
                    ),
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
