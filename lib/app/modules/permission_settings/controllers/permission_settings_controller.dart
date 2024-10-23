import 'package:get/get.dart';
import '../../../data/permission_settings_model.dart';

class PermissionSettingsController extends GetxController {
  // List of permission settings (User Roles and Menus)
  var permissionsList = <permission_settings_model>[].obs;

  // Selected role for editing or viewing menus
  var selectedRole = ''.obs;

  // Adding a new permission (User Role and Menu Name)
  void addPermission(String role, String menuName) {
    permission_settings_model newPermission = permission_settings_model(
      roleModel: role,
      menuName: menuName,
    );
    permissionsList.add(newPermission);
  }

  // Editing an existing permission
  void editPermission(int index, String role, String menuName) {
    if (index < permissionsList.length) {
      permissionsList[index].roleModel = role;
      permissionsList[index].menuName = menuName;
      permissionsList.refresh(); // To trigger UI update
    }
  }

  // Deleting a permission
  void deletePermission(int index) {
    if (index < permissionsList.length) {
      permissionsList.removeAt(index);
    }
  }

  // Uploading the permission settings (Mock functionality)
  void uploadPermissions() {
    // Simulate a data upload process
    print("Permissions uploaded!");
  }

  // Set selected role for viewing/editing
  void selectRole(String role) {
    selectedRole.value = role;
  }

  // Mock data initialization
  @override
  void onInit() {
    super.onInit();
    // Optionally, you can add mock data for initial display
    permissionsList.addAll([
      permission_settings_model(roleModel: 'Admin', menuName: 'Dashboard'),
      permission_settings_model(roleModel: 'User', menuName: 'Profile'),
      permission_settings_model(roleModel: 'Guest', menuName: 'Home'),
    ]);
  }
}
