import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/sidebar/controllers/sidebar_controller.dart';
import '../../../../constanta/app_colors.dart';

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
          _buildDrawerHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildListTile('Home Page', Icons.home, 0, '/home'),
                  _buildParentItem('Basic Settings', Icons.settings, 1, [
                    _buildSubItem('Company Information', Icons.minimize_rounded,
                        1, '/company-information'),
                    _buildSubItem(
                        'User Role', Icons.minimize_rounded, 2, '/user-role'),
                    _buildSubItem('Permission Settings', Icons.minimize_rounded,
                        3, '/permission-settings'),
                    _buildSubItem('User Management', Icons.minimize_rounded, 4,
                        '/user-management'),
                    _buildSubItem('Commodity Category', Icons.minimize_rounded,
                        5, '/commodity-category'),
                    _buildSubItem('Commodity Management',
                        Icons.minimize_rounded, 6, '/commodity-management'),
                    _buildSubItem('Supplier Info', Icons.minimize_rounded, 7,
                        '/supplier-info'),
                    _buildSubItem('Warehouse Settings', Icons.minimize_rounded,
                        8, '/warehouse-settings'),
                    _buildSubItem('Owner Information', Icons.minimize_rounded,
                        9, '/owner-information'),
                    _buildSubItem('Freight Setting', Icons.minimize_rounded, 10,
                        '/freight-setting'),
                    _buildSubItem('Customer Info', Icons.minimize_rounded, 11,
                        '/customer-info'),
                    _buildSubItem('Print Settings', Icons.minimize_rounded, 12,
                        '/print-settings'),
                  ]),
                  _buildListTile('Receiving Management', Icons.notifications, 2,
                      '/receiving-management'),
                  _buildListTile('Stock Management', Icons.inventory_2, 3,
                      '/stock-management'), // route belum ada
                  _buildParentItem('Statistic Analysis', Icons.analytics, 4, [
                    _buildSubItem('Safety Stock', Icons.minimize_rounded, 13,
                        '/safety-stock'), // route belum ada
                    _buildSubItem(
                        'Receiving Statistics',
                        Icons.minimize_rounded,
                        14,
                        '/receiving-statistics'), // route belum ada
                    _buildSubItem('Shipment Statistics', Icons.minimize_rounded,
                        15, '/shipment-statistics'), // route belum ada
                  ]),
                  _buildParentItem('Warehouse Working', Icons.warehouse, 5, [
                    _buildSubItem(
                        'Warehouse Processing',
                        Icons.minimize_rounded,
                        16,
                        '/warehouse-processing'), // route belum ada
                    _buildSubItem('Inventory Move', Icons.minimize_rounded, 17,
                        '/inventory-move'), // route belum ada
                    _buildSubItem('Inventory Freeze', Icons.minimize_rounded,
                        18, '/inventory-freeze'), // route belum ada
                    _buildSubItem('Inventory Adjust', Icons.minimize_rounded,
                        19, '/inventory-adjust'), // route belum ada
                    _buildSubItem('Inventory Take', Icons.minimize_rounded, 20,
                        '/inventory-take'), // route belum ada
                  ]),
                  _buildListTile('Delivery Management', Icons.delivery_dining,
                      6, '/delivery-management'), // route belum ada
                  _buildListTile('Visual Warehouse', Icons.visibility, 7,
                      '/visual-warehouse'), // route belum ada
                ],
              ),
            ),
          ),
          _buildBackButton(),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: Center(
        child: Image.asset('assets/images/logo-construx.png', width: 400.0),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, int index, String route) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(
              milliseconds: 300), // Durasi animasi transisi warna
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? AppColors.hijau
                : AppColors.abu,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(title, style: const TextStyle(color: Colors.white)),
            onTap: () {
              controller.selectItem(index);
              controller.selectSubItem(-1);
              controller.navigateWithDelay(route);
            },
          ),
        ));
  }

  Widget _buildParentItem(
      String title, IconData icon, int index, List<Widget> subItems) {
    return Obx(() => Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == index
                    ? AppColors.hijau
                    : AppColors.abu,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                leading: Icon(icon, color: Colors.white),
                title: Text(title, style: const TextStyle(color: Colors.white)),
                trailing: Icon(
                    controller.isExpanded(index)
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: Colors.white),
                onTap: () {
                  controller.toggleExpand(index);
                  controller.selectItem(index);
                },
              ),
            ),
            AnimatedSize(
              duration: const Duration(
                  milliseconds:
                      300), // Durasi animasi untuk membuka/tutup sublist
              child: Column(
                children: controller.isExpanded(index) ? subItems : [],
              ),
            ),
          ],
        ));
  }

  Widget _buildSubItem(
      String title, IconData icon, int subIndex, String route) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(left: 40, top: 5),
          decoration: BoxDecoration(
            color: controller.selectedSubIndex.value == subIndex
                ? AppColors.putih
                : AppColors.abu,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(icon,
                color: controller.selectedSubIndex.value == subIndex
                    ? Colors.black
                    : Colors.white),
            title: Text(title,
                style: TextStyle(
                    color: controller.selectedSubIndex.value == subIndex
                        ? AppColors.textGelap
                        : Colors.white)),
            onTap: () {
              controller.selectSubItem(subIndex);
              controller.navigateWithDelay(route);
            },
          ),
        ));
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: ElevatedButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back, color: AppColors.putih),
        label: const Text('Back', style: TextStyle(color: AppColors.putih)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.abuGelap,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
