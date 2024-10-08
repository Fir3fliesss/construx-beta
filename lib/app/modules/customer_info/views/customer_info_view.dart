import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';

class CustomerInfoView extends StatelessWidget {
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
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > Customer Info',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
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
                              // Action Buttons
                              buildCircleIconButton(Icons.add_circle_outline, "Add", AppColors.abuabu),
                              const SizedBox(width: 16),
                              buildCircleIconButton(Icons.refresh, "Refresh", AppColors.abuabu),
                              const SizedBox(width: 16),
                              buildCircleIconButton(Icons.upload_outlined, "Upload", AppColors.abuabu),
                            ],
                          ),
                        ),

                        // Data table with wrapped text in header
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
                                columnSpacing: 20,
                                columns: const [
                                  DataColumn(
                                    label: Text('No', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Customer Name', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('City', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Address', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Manager', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Email', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Contact Telp', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Creator', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Create Time', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Last Update Time', style: TextStyle(fontSize: 12)),
                                  ),
                                  DataColumn(
                                    label: Text('Operate', style: TextStyle(fontSize: 12)),
                                  ),
                                ],
                                rows: List.generate(
                                  15,
                                  (index) => DataRow(cells: [
                                    DataCell(Center(child: Text('${index + 1}'))),
                                    DataCell(Center(child: Text('20240824-0003'))),
                                    DataCell(Center(child: Text('Jakarta'))),
                                    DataCell(Center(child: Text('Jakarta'))),
                                    DataCell(Center(child: Text('Byotos'))),
                                    DataCell(Center(child: Text(index == 1 ? 'ali' : '-'))),
                                    DataCell(Center(child: Text(index == 1 ? 'ali' : '-'))),
                                    DataCell(Center(child: Text('ali'))),
                                    DataCell(Center(child: Text(index == 1 ? '2024-09-11 11:40' : '-'))),
                                    DataCell(Center(child: Text(index == 1 ? '2024-09-11 11:40' : '-'))),
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