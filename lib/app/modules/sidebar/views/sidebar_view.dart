
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constanta/app_colors.dart';
import 'package:construx_beta/app/modules/sidebar/controllers/sidebar_controller.dart';

class Sidebar extends StatelessWidget {
  final SidebarController controller = Get.put(SidebarController());
  Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: AppColors.abu,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/CONSTRUX-LOGO.png',
                  width: 400.0,
                ),
              ],
            ),
          ),
          Obx(() => Container(
            color: controller.selectedIndex.value == 0
                      ? AppColors.hijau
                      : AppColors.abu,
            child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Home Page',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    controller.selectItem(0);
                    controller.selectSubItem(-1);
                    controller.navigateWithDelay('/home');
                  },
                ),
          )),
          Obx(() => ExpansionTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Basic Settings',
                  style: TextStyle(color: Colors.white),
                ),
                tilePadding: EdgeInsets.symmetric(horizontal: 16),
                collapsedBackgroundColor: Colors.transparent,
                backgroundColor: controller.selectedIndex.value == 1
                    ? AppColors.hijau
                    : Colors.transparent,
                initiallyExpanded: controller.isExpanded(1),
                onExpansionChanged: (bool expanded) {
                  controller.toggleExpand(1);
                  if (expanded) {
                    controller.selectItem(1);
                  }
                },
                children: <Widget>[
                  Container(
                    color: controller.selectedSubIndex.value == 1
                        ? AppColors.putih
                        : AppColors.abu,
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 50.0),
                      leading: Icon(
                        Icons.info,
                        color: controller.selectedSubIndex.value == 1
                            ? Colors.black
                            : AppColors.putih,
                      ),
                      title: Text(
                        'Company Information',
                        style: TextStyle(
                          color: controller.selectedSubIndex.value == 1
                              ? AppColors.textGelap
                              : AppColors.putih,
                        ),
                      ),
                      tileColor: controller.selectedSubIndex.value == 1
                          ? Colors.white
                          : Colors.transparent,
                      onTap: () {
                        controller.selectSubItem(1);
                        controller.navigateWithDelay('/company-information');
                      },
                    ),
                  ),
                  Container(
                    color: controller.selectedSubIndex.value == 2
                        ? AppColors.putih
                        : AppColors.abu,
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 50.0),
                      leading: Icon(
                        Icons.person,
                        color: controller.selectedSubIndex.value == 2
                            ? Colors.black
                            : AppColors.putih,
                      ),
                      title: Text(
                        'User Role',
                        style: TextStyle(
                          color: controller.selectedSubIndex.value == 2
                              ? AppColors.textGelap
                              : AppColors.putih,
                        ),
                      ),
                      tileColor: controller.selectedSubIndex.value == 2
                          ? Colors.white
                          : Colors.transparent,
                      onTap: () {
                        controller.selectSubItem(2);
                        controller.navigateWithDelay('/user-role');
                      },
                    ),
                  ),
                  Container(
                    color: controller.selectedSubIndex.value == 3
                        ? AppColors.putih
                        : AppColors.abu,
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 50.0),
                      leading: Icon(
                        Icons.category_outlined,
                        color: controller.selectedSubIndex.value == 3
                            ? Colors.black
                            : AppColors.putih,
                      ),
                      title: Text(
                        'Commodity Category',
                        style: TextStyle(
                          color: controller.selectedSubIndex.value == 3
                              ? AppColors.textGelap
                              : AppColors.putih,
                        ),
                      ),
                      tileColor: controller.selectedSubIndex.value == 3
                          ? Colors.white
                          : Colors.transparent,
                      onTap: () {
                        controller.selectSubItem(3);
                        controller.navigateWithDelay('/commodity-category');
                      },
                    ),
                  ),
                ],
              )),

              Obx(() => Container(
                color: controller.selectedIndex.value == 2
                    ? AppColors.hijau
                    : AppColors.abu,
                child: ListTile(
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Receiving Management',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    controller.selectItem(2);
                    controller.selectSubItem(-1);
                    controller.navigateWithDelay('/receiving-management');
                  },
                ),
              ))
        ],
      ),
    );
  }
}
