import 'package:get/get.dart';

import '../modules/commodity_category/bindings/commodity_category_binding.dart';
import '../modules/commodity_category/views/commodity_category_view.dart';
import '../modules/commodity_management/bindings/commodity_management_binding.dart';
import '../modules/commodity_management/views/commodity_management_view.dart';
import '../modules/company_information/bindings/company_information_binding.dart';
import '../modules/company_information/views/company_information_view.dart';
import '../modules/customer_info/bindings/customer_info_binding.dart';
import '../modules/customer_info/views/customer_info_view.dart';
import '../modules/freight_setting/bindings/freight_setting_binding.dart';
import '../modules/freight_setting/views/freight_setting_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_page_layout.dart';
import '../modules/owner_information/bindings/owner_information_binding.dart';
import '../modules/owner_information/views/owner_information_view.dart';
import '../modules/permission_settings/bindings/permission_settings_binding.dart';
import '../modules/permission_settings/views/permission_settings_view.dart';
import '../modules/print_settings/bindings/print_settings_binding.dart';
import '../modules/print_settings/views/print_settings_view.dart';
import '../modules/receiving_management/bindings/receiving_management_binding.dart';
import '../modules/receiving_management/views/receiving_management_view.dart';
import '../modules/supplier_info/bindings/supplier_info_binding.dart';
import '../modules/supplier_info/views/supplier_info_view.dart';
import '../modules/user_management/bindings/user_management_binding.dart';
import '../modules/user_management/views/user_management_view.dart';
import '../modules/user_role/bindings/user_role_binding.dart';
import '../modules/user_role/views/user_role_view.dart';
import '../modules/warehouse_settings/bindings/warehouse_settings_binding.dart';
import '../modules/warehouse_settings/views/warehouse_settings_view.dart';

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
    GetPage(
      name: _Paths.WAREHOUSE_SETTINGS,
      page: () => MainLayout(
        child: WarehouseSettingsView(),
        loadingController: Get.find(),
      ),
      binding: WarehouseSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION_SETTINGS,
      page: () => MainLayout(
        child: const PermissionSettingsView(),
        loadingController: Get.find(),
      ),
      binding: PermissionSettingsBinding(),
    ),
    GetPage(
      name: _Paths.USER_MANAGEMENT,
      page: () => MainLayout(
        child: const UserManagementView(),
        loadingController: Get.find(),
      ),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: _Paths.COMMODITY_MANAGEMENT,
      page: () => MainLayout(
        child: const CommodityManagementView(),
        loadingController: Get.find(),
      ),
      binding: CommodityManagementBinding(),
    ),
    GetPage(
      name: _Paths.SUPPLIER_INFO,
      page: () => MainLayout(
        child: const SupplierInfoView(),
        loadingController: Get.find(),
      ),
      binding: SupplierInfoBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_INFORMATION,
      page: () => MainLayout(
        child: const OwnerInformationView(),
        loadingController: Get.find(),
      ),
      binding: OwnerInformationBinding(),
    ),
    GetPage(
      name: _Paths.FREIGHT_SETTING,
      page: () => MainLayout(
        child: const FreightSettingView(),
        loadingController: Get.find(),
      ),
      binding: FreightSettingBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_INFO,
      page: () => MainLayout(
        child: const CustomerInfoView(),
        loadingController: Get.find(),
      ),
      binding: CustomerInfoBinding(),
    ),
    GetPage(
      name: _Paths.PRINT_SETTINGS,
      page: () => MainLayout(
        child: const PrintSettingsView(),
        loadingController: Get.find(),
      ),
      binding: PrintSettingsBinding(),
    ),
  ];
}