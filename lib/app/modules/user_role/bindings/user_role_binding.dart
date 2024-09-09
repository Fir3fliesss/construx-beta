import 'package:get/get.dart';

import '../controllers/user_role_controller.dart';

class UserRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRoleController>(
      () => UserRoleController(),
    );
  }
}
