import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';

class WarehouseSettingsView extends StatelessWidget {
  final WarehouseSettingsController controller = Get.put(WarehouseSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text('Basic Setting', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Basic Setting > Warehouse Setting', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Tabs: Warehouse Setting, Reservoir Setting, Location Setting
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                buildTabButton(0, "Warehouse Setting", Icons.settings),
                SizedBox(width: 16.0),
                buildTabButton(1, "Reservoir Setting", Icons.water),
                SizedBox(width: 16.0),
                buildTabButton(2, "Location Setting", Icons.location_on),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Container for table and actions
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0), // Updated padding
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Ensure alignment starts from the left
                children: [
                  // Action buttons (aligned with the table)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
                    children: [
                      buildCircleIconButton(Icons.add, "Add", AppColors.abuabu),
                      SizedBox(width: 10.0),
                      buildCircleIconButton(Icons.delete, "Delete", AppColors.abuabu),
                      SizedBox(width: 10.0),
                      buildCircleIconButton(Icons.print, "Print", AppColors.abuabu),
                      SizedBox(width: 10.0),
                      buildCircleIconButton(Icons.refresh, "Refresh", AppColors.abuabu),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Data table
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                        columns: const [
                          DataColumn(label: Text('No')),
                          DataColumn(label: Text('Warehouse Name')),
                          DataColumn(label: Text('City')),
                          DataColumn(label: Text('Address')),
                          DataColumn(label: Text('Contact Telp')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Manager')),
                          DataColumn(label: Text('Creator')),
                          DataColumn(label: Text('Create Time')),
                          DataColumn(label: Text('Valid')),
                          DataColumn(label: Text('Operations')),
                        ],
                        rows: List.generate(
                          10,
                          (index) => DataRow(cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text('Warehouse ${index + 1}')),
                            DataCell(Text('City $index')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('Yes')),
                            DataCell(Row(
                              children: [
                                Icon(Icons.edit, color: Colors.blue),
                                SizedBox(width: 8.0),
                                Icon(Icons.delete, color: Colors.red),
                              ],
                            )),
                          ]),
                        ),
                      ),
                    ),
                  ),

                  // Pagination (aligned under the table)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_left),
                      ),
                      for (int i = 1; i <= 5; i++) 
                        buildPaginationButton(i, i == 3), // Page 3 is active
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              ),
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
          backgroundColor: controller.selectedButton.value == index ? AppColors.hijau : Colors.white,
          foregroundColor: controller.selectedButton.value == index ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
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
      margin: EdgeInsets.symmetric(horizontal: 4.0),
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