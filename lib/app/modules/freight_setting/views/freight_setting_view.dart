import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';
import 'package:construx_beta/app/modules/freight_setting/controllers/freight_setting_controller.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class FreightSettingView extends StatelessWidget {
  final FreightSettingController controller =
      Get.put(FreightSettingController());

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
                            'Basic Settings > Location Settings',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                                buildCircleIconButton(Icons.add_circle_outline,
                                    'Add', AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(
                                    Icons.refresh, 'Refresh', AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(Icons.upload_outlined,
                                    'Upload', AppColors.abuabu),
                              ],
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              bool isSmallScreen = constraints.maxWidth < 1000;
                              return Container(
                                constraints: BoxConstraints(
                                  minWidth: double.infinity,
                                  maxHeight: 500,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: isSmallScreen
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: isSmallScreen
                                              ? 1000
                                              : constraints.maxWidth,
                                        ),
                                        child: DataTable(
                                          headingRowColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey[200]),
                                          columnSpacing: 10,
                                          columns: [
                                            DataColumn(
                                                label: Text('No',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text('Warehouse Name',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text('Reservoir Name',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Reservoir Category',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text('Location Code',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Location Length (m)',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Location Width (m)',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Location Height (m)',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Location Volume (m³)',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text(
                                                    'Location Load (kg)',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                            DataColumn(
                                                label: Text('Operate',
                                                    style: TextStyle(
                                                        fontSize: 12))),
                                          ],
                                          rows: List.generate(
                                            10,
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(Center(
                                                    child: Text(
                                                        '${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Warehouse ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Reservoir ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Category ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Code ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Length ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Width ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Height ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Volume ${index + 1}'))),
                                                DataCell(Center(
                                                    child: Text(
                                                        'Load ${index + 1}'))),
                                                const DataCell(
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.edit,
                                                          color: Colors.blue),
                                                      SizedBox(width: 30.0),
                                                      Icon(Icons.delete,
                                                          color: Colors.red),
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
