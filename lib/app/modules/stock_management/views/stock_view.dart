import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:construx_beta/app/modules/stock_management/views/tab_button.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import '../controllers/stock_management_controller.dart';

class StockView extends StatelessWidget {
  final StockManagementController controller =
      Get.put(StockManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
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
                              'Stock Management',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Stock Management > Stock',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TabButtons(),
                      ),
                      const SizedBox(height: 16.0),

                      // Container for table and actions
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(5.0), // Updated padding
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
                                    buildCircleIconButton(
                                        Icons.add_circle_outline,
                                        'Add',
                                        AppColors.abuabu),
                                    const SizedBox(width: 16),
                                    buildCircleIconButton(Icons.refresh,
                                        'Refresh', AppColors.abuabu),
                                    const SizedBox(width: 16),
                                    buildCircleIconButton(Icons.upload_outlined,
                                        'Upload', AppColors.abuabu),
                                    const Spacer(),
                                    Container(
                                      width: 200,
                                      height:
                                          50, 
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Supplier Name',
                                          hintStyle: TextStyle(
                                            color: AppColors.textGelap, 
                                            fontSize:
                                                16, 
                                          ),
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.all(
                                              12.0), 
                                        ),
                                        textAlignVertical: TextAlignVertical
                                            .center, 
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      width: 200,
                                      height: 50,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Form Name',
                                          hintStyle: TextStyle(
                                            color: AppColors.textGelap, 
                                            fontSize:
                                                16,
                                          ),
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.all(
                                              12.0),
                                        ),
                                        textAlignVertical: TextAlignVertical.center, 
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Data table
                              Container(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                  maxHeight: 500,
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DataTable(
                                      headingRowColor: WidgetStateProperty.all(
                                          Colors.grey[200]),
                                      columnSpacing:
                                          10, 
                                      columns: [
                                        const DataColumn(label: Text('No', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('')),
                                        const DataColumn(label: Text('Commodity Code', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Trade Name', style: TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text(
                                                'Specification Code', style: TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Available Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Locked Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Frozen Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Asn Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Unload Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Sort Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Sorted Quantity', style: TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('Shortage Quantity', style: TextStyle(fontSize: 12))),   
                                      ],
                                      rows: List.generate(
                                        15,
                                        (index) => DataRow(cells: [
                                          DataCell(Text('${index + 1}')),
                                          DataCell(Checkbox(
                                              value: false,
                                              onChanged: (bool? value) {})),
                                          const DataCell(Text('20240824-0003')),
                                          DataCell(Text(index < 2
                                              ? '${333 + index}'
                                              : '3433')),
                                          const DataCell(Text('2024-08-1')),
                                          const DataCell(Text('-')),
                                          const DataCell(Text('-')),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
