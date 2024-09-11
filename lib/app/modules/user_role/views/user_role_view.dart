import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_role_controller.dart';
import '../../sidebar/views/sidebar_view.dart';
import '../../../../constanta/app_colors.dart';
import '../../appbar/views/appbar_view.dart';

class UserRoleView extends GetView<UserRoleController> {
  const UserRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarView(),
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
                        'Basic Settings > User Role',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.abuabu,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
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
                                onPressed: controller.showAddUserRoleDialog,
                              ),
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
                                onPressed: () {
                                  controller.userRoles.refresh();
                                },
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
                                onPressed: () {
                                  controller.exportUserRoles();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          maxHeight: 500,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Obx(() {
                              return DataTable(
                                headingRowColor: 
                                    WidgetStateProperty.all(AppColors.abuabu),
                                columnSpacing: 255.0,
                                columns: const [
                                  DataColumn(label: Text('No')),
                                  DataColumn(label: Text('User Role')),
                                  DataColumn(label: Text('Valid')),
                                  DataColumn(label: Text('Operate')),
                                ],
                                rows: controller.userRoles.map((userRole) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(userRole.no.toString())),
                                      DataCell(Text(userRole.userRole ?? '-')),
                                      DataCell(Text(userRole.valid ?? '-')),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () => controller.editUserRole(userRole),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () => controller.deleteUserRole(userRole),
                                          ),
                                        ],
                                      )),
                                    ],
                                  );
                                }).toList(),
                              );
                            }),
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
}
