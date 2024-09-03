import 'package:get/get.dart';

import '../modules/company_information/bindings/company_information_binding.dart';
import '../modules/company_information/views/company_information_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sidebar/bindings/sidebar_binding.dart';
import '../modules/sidebar/views/sidebar_view.dart';

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
      page: () => const CompanyInformationView(),
      binding: CompanyInformationBinding(),
    ),
    GetPage(
      name: _Paths.SIDEBAR,
      page: () => const Sidebar(),
      binding: SidebarBinding(),
    ),
  ];
}
