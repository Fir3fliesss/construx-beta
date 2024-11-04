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
import '../modules/inventory_move/bindings/inventory_move_binding.dart';
import '../modules/inventory_move/views/inventory_move_view.dart';
import '../modules/main_page_layout.dart';
import '../modules/owner_information/bindings/owner_information_binding.dart';
import '../modules/owner_information/views/owner_information_view.dart';
import '../modules/permission_settings/bindings/permission_settings_binding.dart';
import '../modules/permission_settings/views/permission_settings_view.dart';
import '../modules/print_settings/bindings/print_settings_binding.dart';
import '../modules/print_settings/views/print_settings_view.dart';
import '../modules/receiving_management/bindings/receiving_management_binding.dart';
import '../modules/receiving_management/views/put_on_shelf_view.dart';
import '../modules/receiving_management/views/receipt_details_view.dart';
import '../modules/receiving_management/views/receiving_management_view.dart';
import '../modules/receiving_management/views/to_be_delivered_view.dart';
import '../modules/receiving_management/views/to_be_sorted_view.dart';
import '../modules/receiving_management/views/to_be_unloaded_view.dart';
import '../modules/receiving_statistics/bindings/receiving_statistics_binding.dart';
import '../modules/receiving_statistics/views/receiving_statistics_view.dart';
import '../modules/safety_stock/bindings/safety_stock_binding.dart';
import '../modules/safety_stock/views/safety_stock_view.dart';
import '../modules/shipment_statistics/bindings/shipment_statistics_binding.dart';
import '../modules/shipment_statistics/views/shipment_statistics_view.dart';
import '../modules/stock_management/bindings/stock_management_binding.dart';
import '../modules/stock_management/views/stock_management_view.dart';
import '../modules/stock_management/views/stock_view.dart';
import '../modules/supplier_info/bindings/supplier_info_binding.dart';
import '../modules/supplier_info/views/supplier_info_view.dart';
import '../modules/user_management/bindings/user_management_binding.dart';
import '../modules/user_management/views/user_management_view.dart';
import '../modules/user_role/bindings/user_role_binding.dart';
import '../modules/user_role/views/user_role_view.dart';
import '../modules/warehouse_processing/bindings/warehouse_processing_binding.dart';
import '../modules/warehouse_processing/views/warehouse_processing_view.dart';
import '../modules/warehouse_settings/bindings/warehouse_settings_binding.dart';
import '../modules/warehouse_settings/views/location_settings_view.dart';
import '../modules/warehouse_settings/views/reservoir_settings_view.dart';
import '../modules/warehouse_settings/views/warehouse_settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: const HomePage(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_INFORMATION,
      page: () => CompanyInformationView(),
      binding: CompanyInformationBinding(),
    ),
    GetPage(
      name: _Paths.USER_ROLE,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: const UserRoleView(),
      ),
      binding: UserRoleBinding(),
    ),
    GetPage(
      name: _Paths.COMMODITY_CATEGORY,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: const CommodityCategoryView(),
      ),
      binding: CommodityCategoryBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVING_MANAGEMENT,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ReceivingManagementView(),
      ),
      binding: ReceivingManagementBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE_SETTINGS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: WarehouseSettingsView(),
      ),
      binding: WarehouseSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION_SETTINGS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: const PermissionSettingsView(),
      ),
      binding: PermissionSettingsBinding(),
    ),
    GetPage(
      name: _Paths.USER_MANAGEMENT,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: UserManagementView(),
      ),
      binding: UserManagementBinding(),
    ),
    GetPage(
      name: _Paths.COMMODITY_MANAGEMENT,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: CommodityManagementView(),
      ),
      binding: CommodityManagementBinding(),
    ),
    GetPage(
      name: _Paths.SUPPLIER_INFO,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: SupplierInfoView(),
      ),
      binding: SupplierInfoBinding(),
    ),
    GetPage(
      name: _Paths.OWNER_INFORMATION,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: OwnerInformationView(),
      ),
      binding: OwnerInformationBinding(),
    ),
    GetPage(
      name: _Paths.FREIGHT_SETTING,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: FreightSettingView(),
      ),
      binding: FreightSettingBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_INFO,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: CustomerInfoView(),
      ),
      binding: CustomerInfoBinding(),
    ),
    GetPage(
      name: _Paths.PRINT_SETTINGS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: const PrintSettingsView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.RESERVOIR_SETTINGS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ReservoirSettingsView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_SETTINGS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: LocationSettingsView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.TO_BE_DELIVERED,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ToBeDeliveredView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.TO_BE_UNLOADED,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ToBeUnloadedView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.TO_BE_SORTED,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ToBeSortedView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PUT_ON_SHELF,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: PutOnShelfView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT_DETAILS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ReceiptDetailsView(),
      ),
      binding: PrintSettingsBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_MANAGEMENT,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: StockManagementView(),
      ),
      binding: StockManagementBinding(),
    ),
    GetPage(
      name: _Paths.STOCK,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: StockView(),
      ),
      binding: StockManagementBinding(),
    ),
    GetPage(
      name: _Paths.SAFETY_STOCK,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: SafetyStockView(),
      ),
      binding: SafetyStockBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVING_STATISTICS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ReceivingStatisticsView(),
      ),
      binding: ReceivingStatisticsBinding(),
    ),
    GetPage(
      name: _Paths.SHIPMENT_STATISTICS,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: ShipmentStatisticsView(),
      ),
      binding: ShipmentStatisticsBinding(),
    ),
    GetPage(
      name: _Paths.WAREHOUSE_PROCESSING,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: WarehouseProcessingView(),
      ),
      binding: WarehouseProcessingBinding(),
    ),  
    GetPage(
      name: _Paths.INVENTORY_MOVE,
      page: () => MainLayout(
        loadingController: Get.find(),
        child: InventoryMoveView(),
      ),
      binding: WarehouseProcessingBinding(),
    ),
  ];
}
