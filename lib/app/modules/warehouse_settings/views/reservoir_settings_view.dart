import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';
import 'tab_buttons.dart';

class ReservoirSettingsView extends StatelessWidget {
  final WarehouseSettingsController controller = Get.put(WarehouseSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                        'Basic Setting',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > Company Information',
                        style: TextStyle(color: Colors.black54),
                      ),
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
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.abuabu, width: 2.0),
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
                                "Add", 
                                AppColors.abuabu
                              ),
                              const SizedBox(width: 16),
                              buildCircleIconButton(
                                Icons.refresh, 
                                "Refresh", 
                                AppColors.abuabu
                              ),
                              const SizedBox(width: 16),
                              buildCircleIconButton(
                                Icons.upload_outlined, 
                                "Upload", 
                                AppColors.abuabu
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
                                headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                                columnSpacing: 20, // Jarak antar kolom
                                columns: const [
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('No'))), 
                                  ),
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('Warehouse Name'))),
                                  ),
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('Reservoir Name'))),
                                  ),
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('Reservoir Category'))),
                                  ),
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('Valid'))),
                                  ),
                                  DataColumn(
                                    label: Expanded(child: Center(child: Text('Operate'))),
                                  ),
                                ],
                                rows: List.generate(
                                  10,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(Center(child: Text('${index + 1}'))),
                                      DataCell(Center(child: Text('Warehouse ${index + 1}'))),
                                      DataCell(Center(child: Text('City $index'))),
                                      const DataCell(Center(child: Text('picking Area'))),
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
                                    ],
                                  ),
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
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
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
