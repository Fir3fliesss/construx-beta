import 'package:get/get.dart';

import '../modules/commodity_category/bindings/commodity_category_binding.dart';
import '../modules/commodity_category/views/commodity_category_view.dart';
import '../modules/company_information/bindings/company_information_binding.dart';
import '../modules/company_information/views/company_information_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/receiving_management/bindings/receiving_management_binding.dart';
import '../modules/receiving_management/views/receiving_management_view.dart';
import '../modules/user_role/bindings/user_role_binding.dart';
import '../modules/user_role/views/user_role_view.dart';
import '../modules/main_page_layout.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MainLayout(
        child: const HomePage(),
        loadingController: Get.find(), 
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_INFORMATION,
      page: () => MainLayout(
        child: const CompanyInformationView(),
        loadingController: Get.find(), 
      ),
      binding: CompanyInformationBinding(),
    ),
    GetPage(
      name: _Paths.USER_ROLE,
      page: () => MainLayout(
        child: const UserRoleView(),
        loadingController: Get.find(), 
      ),
      binding: UserRoleBinding(),
    ),
    GetPage(
      name: _Paths.COMMODITY_CATEGORY,
      page: () => MainLayout(
        child: const CommodityCategoryView(),
        loadingController: Get.find(), 
      ),
      binding: CommodityCategoryBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVING_MANAGEMENT,
      page: () => MainLayout(
        child: const ReceivingManagementView(),
        loadingController: Get.find(), 
      ),
      binding: ReceivingManagementBinding(),
    ),
  ];
}