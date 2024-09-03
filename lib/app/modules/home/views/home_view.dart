import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import '../../sidebar/views/sidebar_view.dart';

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
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.abu,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu),
                      // TextField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide:
                      //           BorderSide(color: Colors.blue, width: 2.0),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide:
                      //           BorderSide(color: Colors.grey, width: 1.0),
                      //     ),
                      //     prefixIcon: Icon(Icons.search), // Ikon pencarian
                      //     hintText: 'Search here...', // Teks hint
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 16.0,
                      //         vertical: 12.0), // Padding di dalam TextField
                      //   ),
                      //   style: TextStyle(fontSize: 16.0),
                      // )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
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
