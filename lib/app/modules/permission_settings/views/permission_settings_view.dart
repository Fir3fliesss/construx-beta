import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/permission_settings_controller.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class PermissionSettingsView extends StatelessWidget {
  const PermissionSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PermissionSettingsController controller = Get.put(PermissionSettingsController());

    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Basic Settings",
      menuSubName: "Permission Settings",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            // Header section with title and path
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Basic Setting',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Basic Settings > Permission settings',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Container with actions and tables
            Container(
              height: MediaQuery.of(context).size.height - 180, // Adjust height based on screen
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.abuabu, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  // Row with action icons
                  Row(
                    children: [
                      _actionIcon(
                        icon: Icons.add_circle_outline,
                        onPressed: () => _showAddDialog(context, controller),
                      ),
                      _actionIcon(
                        icon: Icons.edit,
                        onPressed: () {
                          if (controller.selectedRole.value != '') {
                            _showEditDialog(context, controller);
                          } else {
                            Get.snackbar('Error', 'Please select a role to edit.');
                          }
                        },
                      ),
                      _actionIcon(
                        icon: Icons.upload_outlined,
                        onPressed: controller.uploadPermissions,
                      ),
                      _actionIcon(
                        icon: Icons.delete,
                        onPressed: () {
                          if (controller.selectedRole.value != '') {
                            _showDeleteDialog(context, controller);
                          } else {
                            Get.snackbar('Error', 'Please select a role to delete.');
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Tables for User Role and Menu Name
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Role Table
                        Expanded(
                          flex: 1,
                          child: Obx(() {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(
                                headingRowHeight: 40,
                                headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                headingRowColor: MaterialStateProperty.all(AppColors.abuabu),
                                dataTextStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                columns: const [
                                  DataColumn(
                                    label: Text('User Role'),
                                  ),
                                ],
                                rows: controller.permissionsList
                                    .map((permission) => DataRow(
                                          cells: [
                                            DataCell(GestureDetector(
                                              onTap: () {
                                                controller.selectRole(permission.roleModel!);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(permission.roleModel ?? 'No Role'),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Colors.grey[400],
                                                  ),
                                                ],
                                              ),
                                            )),
                                          ],
                                        ))
                                    .toList(),
                                border: const TableBorder(
                                  bottom: BorderSide(width: 2, color: AppColors.abuabu),
                                  left: BorderSide(width: 2, color: AppColors.abuabu),
                                  right: BorderSide(width: 2, color: AppColors.abuabu),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(width: 16),
                        // Menu Name Table
                        Expanded(
                          flex: 3,
                          child: Obx(() {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(
                                headingRowHeight: 40,
                                headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                headingRowColor: MaterialStateProperty.all(AppColors.abuabu),
                                dataTextStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                columns: const [
                                  DataColumn(
                                    label: Text('Menu Name'),
                                  ),
                                  DataColumn(
                                    label: Text('Operate'),
                                  ),
                                ],
                                rows: controller.permissionsList
                                    .where((permission) =>
                                        permission.roleModel == controller.selectedRole.value)
                                    .map((permission) => DataRow(
                                          cells: [
                                            DataCell(Row(
                                              children: [
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.grey[400],
                                                ),
                                                Text(permission.menuName ?? 'No Menu'),
                                              ],
                                            )),
                                            DataCell(Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.grey[600],
                                              ),
                                            )),
                                          ],
                                        ))
                                    .toList(),
                                border: const TableBorder(
                                  bottom: BorderSide(width: 2, color: AppColors.abuabu),
                                  left: BorderSide(width: 2, color: AppColors.abuabu),
                                  right: BorderSide(width: 2, color: AppColors.abuabu),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionIcon({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.abuabu,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }

  void _showAddDialog(BuildContext context, PermissionSettingsController controller) {
    String role = '';
    String menuName = '';

    Get.defaultDialog(
      title: 'Add Permission',
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Role'),
            onChanged: (value) => role = value,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Menu Name'),
            onChanged: (value) => menuName = value,
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          controller.addPermission(role, menuName);
          Get.back();
        },
        child: Text('Add'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }

  void _showEditDialog(BuildContext context, PermissionSettingsController controller) {
    String role = controller.selectedRole.value;
    String menuName = controller.permissionsList
            .firstWhere((permission) => permission.roleModel == controller.selectedRole.value)
            .menuName ??
        '';

    Get.defaultDialog(
      title: 'Edit Permission',
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Role'),
            controller: TextEditingController(text: role),
            onChanged: (value) => role = value,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Menu Name'),
            controller: TextEditingController(text: menuName),
            onChanged: (value) => menuName = value,
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          int index = controller.permissionsList.indexWhere(
              (permission) => permission.roleModel == controller.selectedRole.value);
          controller.editPermission(index, role, menuName);
          Get.back();
        },
        child: Text('Edit'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, PermissionSettingsController controller) {
    Get.defaultDialog(
      title: 'Delete Permission',
      content: const Text('Are you sure you want to delete this permission?'),
      confirm: ElevatedButton(
        onPressed: () {
          controller.deletePermission(controller.selectedRole.value as int);
          Get.back();
        },
        child: Text('Delete'),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
    );
  }
}
