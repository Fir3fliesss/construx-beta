import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.background,
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(
                      child: Text('ConstruX', style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.w500)),
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
