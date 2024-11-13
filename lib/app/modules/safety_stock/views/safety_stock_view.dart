import 'package:construx_beta/app/modules/safety_stock/controllers/safety_stock_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';

import 'package:construx_beta/app/modules/safety_stock/views/tab_button.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class SafetyStockView extends StatelessWidget {
  final SafetyStockController controller = Get.put(SafetyStockController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Statistic Analysis",
      menuSubName: "Safety Stock",
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Statistic Analysis',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'Statistic Analysis > Safety Stock',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    // Container for table and actions
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.abuabu, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                // Action Buttons
                                buildCircleIconButton(
                                    Icons.add_circle_outline,
                                    "Add",
                                    AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(Icons.refresh,
                                    "Refresh", AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(Icons.upload_outlined,
                                    "Upload", AppColors.abuabu),
                              ],
                            ),
                          ),

                          // Data table with wrapped text in header
                          LayoutBuilder(
                            builder: (context, constraints) {
                              // Set the threshold width to trigger horizontal scrolling
                              bool isSmallScreen =
                                  constraints.maxWidth < 1000;
                              return Container(
                                constraints: BoxConstraints(
                                  minWidth: double.infinity,
                                  maxHeight: 500,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: SingleChildScrollView(
                                        scrollDirection: isSmallScreen
                                            ? Axis.horizontal
                                            : Axis.vertical,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(20.0),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minWidth: isSmallScreen
                                                  ? 1000
                                                  : constraints.maxWidth,
                                            ),
                                            child: DataTable(
                                              headingRowColor:
                                                  WidgetStateProperty.all(
                                                      Colors.grey[200]),
                                              columnSpacing: 10,
                                              columns: [
                                                DataColumn(
                                                  label: Text('No',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Warehouse Name',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Commodity Code',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Commodity Name',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Identifyng',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Spesification Code',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Spesification Name',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Quantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Available Quantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Locked Quantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Frozen Quantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Safety Stock Quantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                              ],
                                              rows: List.generate(
                                                15,
                                                (index) => DataRow(cells: [
                                                  DataCell(Center(
                                                      child: Text(
                                                          '${index + 1}'))),
                                                  const DataCell(Center(
                                                      child: Text(
                                                          '20240824-0003'))),
                                                  const DataCell(Text(
                                                      '20240824-0003')),
                                                  DataCell(Text(index < 2
                                                      ? '${333 + index}'
                                                      : '3433')),
                                                  const DataCell(
                                                      Text('2024-08-1')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Circular IconButton for action buttons

  Widget buildCircleIconButton(IconData icon, String tooltip, Color bgColor) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {},
        ),
      ),
    );
  }
}
