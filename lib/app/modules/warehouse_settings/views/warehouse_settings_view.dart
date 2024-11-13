import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'tab_buttons.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class WarehouseSettingsView extends StatelessWidget {
  final WarehouseSettingsController controller =
      Get.put(WarehouseSettingsController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Basic Settings",
      menuSubName: "Warehouse Settings",
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
                            'Basic Setting',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'Basic Settings > Warehouse Settings',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [TabButtons()],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
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
                                    Icons.add_circle_outline, 'Add', AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(
                                    Icons.refresh, 'Refresh', AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(
                                    Icons.upload_outlined, 'Upload', AppColors.abuabu),
                              ],
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minWidth: double.infinity,
                              maxHeight: 500,
                            ),
                            child: SingleChildScrollView(
                              child: SingleChildScrollView(
                                // scrollDirection: Axis.vertical,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: DataTable(
                                    headingRowColor:
                                        MaterialStateProperty.all(Colors.grey[200]),
                                    columnSpacing: 10,
                                    columns: [
                                      DataColumn(
                                          label: Center(child: Text('No'))),
                                      DataColumn(
                                          label: Center(child: Text('Warehouse Name'))),
                                      DataColumn(
                                          label: Center(child: Text('City'))),
                                      DataColumn(
                                          label: Center(child: Text('Address'))),
                                      DataColumn(
                                          label: Center(child: Text('Contact Telp'))),
                                      DataColumn(
                                          label: Center(child: Text('Email'))),
                                      DataColumn(
                                          label: Center(child: Text('Manager'))),
                                      DataColumn(
                                          label: Center(child: Text('Creator'))),
                                      DataColumn(
                                          label: Center(child: Text('Create Time'))),
                                      DataColumn(
                                          label: Center(child: Text('Valid'))),
                                      DataColumn(
                                          label: Center(child: Text('Operations'))),
                                    ],
                                    rows: List.generate(
                                      10,
                                      (index) => DataRow(cells: [
                                        DataCell(Center(
                                            child: Text('${index + 1}'))),
                                        DataCell(Center(
                                            child: Text('Warehouse ${index + 1}'))),
                                        DataCell(Center(
                                            child: Text('City $index'))),
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
