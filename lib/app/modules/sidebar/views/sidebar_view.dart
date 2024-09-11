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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // Home Page ListTile
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 0
                              ? AppColors.hijau
                              : AppColors.abu,
                          borderRadius: BorderRadius.circular(8.0), // Border radius added here
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Home Page',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            controller.selectItem(0);
                            controller.selectSubItem(-1); // Reset sub-item selection
                            controller.navigateWithDelay('/home'); // Use navigateWithDelay
                          },
                        ),
                      )),

                  // Parent with Sub-items (Settings)
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Parent ListTile
                          Container(
                            decoration: BoxDecoration(
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.hijau
                                  : AppColors.abu,
                              borderRadius: BorderRadius.circular(8.0), // Border radius added here
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'Basic Settings',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
                                controller.isExpanded(1)
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                              ),
                              tileColor: Colors.transparent,
                              onTap: () {
                                controller.selectItem(1); // Memilih item utama
                                controller.toggleExpand(1); // Toggle expand/collapse
                              },
                            ),
                          ),

                          // Expanded Sub-items
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: controller.isExpanded(1) ? null : 0,
                            child: Column(
                              children: [
                                // Sub-item 1
                                Container(
                                  decoration: BoxDecoration(
                                    color: controller.selectedSubIndex.value == 1
                                        ? AppColors.putih
                                        : AppColors.abu,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  margin: const EdgeInsets.only(left: 40.0, top: 5),
                                  child: ListTile(
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
                                    onTap: () {
                                      controller.selectSubItem(1); // Memilih sub-item
                                      controller.navigateWithDelay('/company-information'); // Use navigateWithDelay
                                    },
                                  ),
                                ),

                                // Sub-item 2
                                Container(
                                  decoration: BoxDecoration(
                                    color: controller.selectedSubIndex.value == 2
                                        ? AppColors.putih
                                        : AppColors.abu,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  margin: const EdgeInsets.only(left: 40.0, top: 5),
                                  child: ListTile(
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
                                    onTap: () {
                                      controller.selectSubItem(2); // Memilih sub-item
                                      controller.navigateWithDelay('/user-role'); // Use navigateWithDelay
                                    },
                                  ),
                                ),

                                // Sub-item 3
                                Container(
                                  decoration: BoxDecoration(
                                    color: controller.selectedSubIndex.value == 3
                                        ? AppColors.putih
                                        : AppColors.abu,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  margin: const EdgeInsets.only(left: 40.0, top: 5),
                                  child: ListTile(
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
                                    onTap: () {
                                      controller.selectSubItem(3); // Memilih sub-item
                                      controller.navigateWithDelay('/commodity-category'); // Use navigateWithDelay
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),

                  // Receiving Management ListTile
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 2
                              ? AppColors.hijau
                              : AppColors.abu,
                          borderRadius: BorderRadius.circular(8.0), // Border radius added here
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Receiving Management',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            controller.selectItem(2); // Pilih item utama
                            controller.selectSubItem(-1); // Reset sub-item selection
                            controller.navigateWithDelay('/receiving-management'); // Use navigateWithDelay
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
