import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';
import 'tab_buttons.dart';

class WarehouseSettingsView extends StatelessWidget {
  final WarehouseSettingsController controller =
      Get.put(WarehouseSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text('Basic Setting',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('Basic Setting > Warehouse Setting',
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Tabs: Warehouse Setting, Reservoir Setting, Location Setting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [TabButtons()],
              ),
            ),
            const SizedBox(height: 16.0),

            // Container for table and actions
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(5.0), // Updated padding
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.abuabu, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  // Ensure alignment starts from the left
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.black,
                                onPressed: () => {}),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.refresh),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.upload_outlined),
                              color: Colors.black,
                              onPressed: () {},
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
                          headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
                          columnSpacing: 10, // Memberikan jarak antar kolom yang sesuai
                          columns: const [
                            DataColumn(
                              label: Center(child: Text('No')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Warehouse Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('City')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Address')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Contact Telp')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Email')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Manager')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Creator')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Create Time')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Valid')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Operations')),
                            ),
                          ],
                          rows: List.generate(
                            10,
                            (index) => DataRow(cells: [
                              DataCell(Center(child: Text('${index + 1}'))),
                              DataCell(Center(child: Text('Warehouse ${index + 1}'))),
                              DataCell(Center(child: Text('City $index'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('-'))),
                              const DataCell(Center(child: Text('Yes'))),
                              const DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit, color: Colors.blue),
                                    SizedBox(width: 30.0),
                                    Icon(Icons.delete, color: Colors.red),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),


                    // Pagination (aligned under the table)
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.chevron_left),
                    //     ),
                    //     for (int i = 1; i <= 5; i++)
                    //       buildPaginationButton(i, i == 3), // Page 3 is active
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.chevron_right),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab button builder
  Widget buildTabButton(int index, String text, IconData icon) {
    return Obx(() {
      return ElevatedButton.icon(
        onPressed: () {
          controller.changeButton(index);
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: controller.selectedButton.value == index
                ? AppColors.hijau
                : Colors.white,
            foregroundColor: controller.selectedButton.value == index
                ? Colors.white
                : Colors.black,
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      );
    });
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

  // Pagination button builder
  Widget buildPaginationButton(int pageNumber, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey[300],
      ),
      child: IconButton(
        icon: Text('$pageNumber'),
        onPressed: () {},
        color: isActive ? Colors.white : Colors.black,
      ),
    );
  }
}