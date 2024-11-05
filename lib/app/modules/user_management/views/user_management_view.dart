import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/user_management/controllers/user_management_controller.dart';
import '../../../../constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class UserManagementView extends StatelessWidget {
  final UserManagementController controller = Get.put(UserManagementController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Basic Settings",
      menuSubName: "User Management",
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
                        'Basic Setting',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > User Management',
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
                              columns: const [
                                DataColumn(label: Text('No', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('User Num', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('User Name', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('Role', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('Sex', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('Contact Information', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('Valid', style: TextStyle(fontSize: 12))),
                                DataColumn(label: Text('Operate', style: TextStyle(fontSize: 12))),
                              ],
                              rows: List.generate(
                                10,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(Text('${index + 1}')),
                                    DataCell(Text('20240824-000${index + 3}')),
                                    DataCell(Text('User Name ${index + 1}')),
                                    DataCell(Text('Role ${index % 3}')),
                                    DataCell(Text(index % 2 == 0 ? 'Male' : 'Female')),
                                    DataCell(Text('Contact ${index + 1}')),
                                    DataCell(Text(index % 2 == 0 ? 'Yes' : 'No')),
                                    DataCell(
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.edit, color: Colors.blue),
                                          SizedBox(width: 30.0),
                                          Icon(Icons.delete, color: Colors.red),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              border: const TableBorder(
                                bottom: BorderSide(width: 2, color: AppColors.abuabu),
                                left: BorderSide(width: 2, color: AppColors.abuabu),
                                right: BorderSide(width: 2, color: AppColors.abuabu),
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
          onPressed: () {
            // Add action here
          },
        ),
      ),
    );
  }
}
