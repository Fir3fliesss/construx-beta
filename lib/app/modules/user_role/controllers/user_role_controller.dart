import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/user_role_model.dart';

class UserRoleController extends GetxController {
  var userRoles = <UserRole>[].obs;
  var selectedUserRole = UserRole(no: 0, userRole: '', valid: '').obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  // Memuat data awal untuk user roles
  void loadInitialData() {
    userRoles.assignAll([
      UserRole(no: 1, userRole: 'Admin', valid: 'Yes'),
      UserRole(no: 2, userRole: 'Editor', valid: 'Yes'),
      UserRole(no: 3, userRole: 'Viewer', valid: 'No'),
    ]);
  }

  // Menambahkan user role baru
  void addUserRole() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      userRoles.add(UserRole(
        no: userRoles.length + 1,
        userRole: selectedUserRole.value.userRole,
        valid: selectedUserRole.value.valid,
      ));
      Get.back();
      Get.snackbar('Success', 'User Role added successfully', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Mengedit user role yang ada
  void editUserRole(UserRole role) {
    selectedUserRole.value = role;
    Get.defaultDialog(
      title: 'Edit User Role',
      content: _buildUserRoleForm(),
      textConfirm: 'Save',
      onConfirm: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          role.userRole = selectedUserRole.value.userRole;
          role.valid = selectedUserRole.value.valid;
          userRoles.refresh();
          Get.back();
          Get.snackbar('Success', 'User Role updated successfully', snackPosition: SnackPosition.BOTTOM);
        }
      },
      textCancel: 'Cancel',
    );
  }

  // Menghapus user role
  void deleteUserRole(UserRole role) {
    Get.defaultDialog(
      title: 'Delete User Role',
      middleText: 'Are you sure you want to delete ${role.userRole}?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: () {
        userRoles.remove(role);
        Get.back();
        Get.snackbar('Success', 'User Role deleted successfully', snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

  // Mengekspor user roles ke Excel
  Future<void> exportUserRoles() async {
    try {
      var excel = Excel.createExcel();
      excel.rename(excel.getDefaultSheet()!, 'User_Roles');
      Sheet sheetObject = excel['User_Roles'];

      sheetObject.appendRow([
        TextCellValue('No'),
        TextCellValue('User Role'),
        TextCellValue('Valid'),
      ]);

      for (var role in userRoles) {
        sheetObject.appendRow([
          TextCellValue(role.no.toString()),
          TextCellValue(role.userRole ?? '-'),
          TextCellValue(role.valid ?? '-'),
        ]);
      }

      var fileBytes = excel.save();
      if (fileBytes == null) {
        print('Error: File bytes are null');
        return;
      }

      var directory = await getApplicationDocumentsDirectory();
      var file = File('${directory.path}/user_roles.xlsx');
      file.createSync(recursive: true);
      file.writeAsBytesSync(fileBytes);

      print('File saved to ${file.path}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  // Membangun form untuk menambahkan/mengedit user role
  Widget _buildUserRoleForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: selectedUserRole.value.userRole,
            decoration: const InputDecoration(labelText: 'User Role'),
            onSaved: (value) => selectedUserRole.value.userRole = value!,
            validator: (value) =>
                value!.isEmpty ? 'Please enter a user role' : null,
          ),
          SwitchListTile(
            title: const Text('Valid'),
            value: selectedUserRole.value.valid == 'Yes', // Toggle status
            onChanged: (value) {
              selectedUserRole.value.valid = value ? 'Yes' : 'No'; // Update valid status
            },
          ),
        ],
      ),
    );
  }

  // Menampilkan dialog untuk menambah user role
  void showAddUserRoleDialog() {
    selectedUserRole.value = UserRole(no: 0, userRole: '', valid: '');
    Get.defaultDialog(
      title: 'Add User Role',
      content: _buildUserRoleForm(),
      textConfirm: 'Add',
      onConfirm: addUserRole,
      textCancel: 'Cancel',
    );
  }
}
