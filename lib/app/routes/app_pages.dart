import 'package:get/get.dart';

import '../modules/appbar/bindings/appbar_binding.dart';
import '../modules/appbar/views/appbar_view.dart';
import '../modules/commodity_category/bindings/commodity_category_binding.dart';
import '../modules/commodity_category/views/commodity_category_view.dart';
import '../modules/company_information/bindings/company_information_binding.dart';
import '../modules/company_information/views/company_information_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import 'package:construx_beta/app/modules/sidebar/bindings/sidebar_binding.dart';
import '../modules/sidebar/views/sidebar_view.dart';
import '../modules/user_role/bindings/user_role_binding.dart';
import '../modules/user_role/views/user_role_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_INFORMATION,
      page: () => CompanyInformationView(),
      binding: CompanyInformationBinding(),
    ),
    GetPage(
      name: _Paths.SIDEBAR,
      page: () => Sidebar(),
      binding: SidebarBinding(),
    ),
    GetPage(
      name: _Paths.APPBAR,
      page: () => const AppbarView(),
      binding: AppbarBinding(),
    ),
    GetPage(
      name: _Paths.USER_ROLE,
      page: () => const UserRoleView(),
      binding: UserRoleBinding(),
    ),
    GetPage(
      name: _Paths.COMMODITY_CATEGORY,
      page: () => const CommodityCategoryView(),
      binding: CommodityCategoryBinding(),
    ),
  ];
}
