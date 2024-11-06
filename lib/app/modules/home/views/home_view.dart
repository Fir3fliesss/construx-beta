import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: const SidemenuDashboard(),
      menuName: "ConstruX",
      menuSubName: "Home Page",
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  color: AppColors.background,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(
                    child: Text('ConstruX',
                        style: TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.w500)),
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
