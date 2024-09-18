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
                    _buildSubItem('Company Information', Icons.info, 1, '/company-information'),
                    _buildSubItem('User Role', Icons.person, 2, '/user-role'),
                    _buildSubItem('Commodity Category', Icons.category_outlined, 3, '/commodity-category'),
                  ]),
                  _buildListTile('Receiving Management', Icons.notifications, 2, '/receiving-management'),
                  _buildListTile('Stock Management', Icons.inventory_2, 3, '/stock-management'),
                  _buildParentItem('Statistic Analysis', Icons.analytics, 4, [
                    _buildSubItem('Safety Stock', Icons.security, 4, '/safety-stock'),
                    _buildSubItem('Receiving Statistics', Icons.trending_up, 5, '/receiving-statistics'),
                    _buildSubItem('Shipment Statistics', Icons.local_shipping, 6, '/shipment-statistics'),
                  ]),
                  _buildParentItem('Warehouse Working', Icons.warehouse, 5, [
                    _buildSubItem('Warehouse Processing', Icons.autorenew, 7, '/warehouse-processing'),
                    _buildSubItem('Inventory Move', Icons.move_to_inbox, 8, '/inventory-move'),
                    _buildSubItem('Inventory Freeze', Icons.ac_unit, 9, '/inventory-freeze'),
                    _buildSubItem('Inventory Adjust', Icons.adjust, 10, '/inventory-adjust'),
                    _buildSubItem('Inventory Take', Icons.takeout_dining, 11, '/inventory-take'),
                  ]),
                  _buildListTile('Delivery Management', Icons.delivery_dining, 6, '/delivery-management'),
                  _buildListTile('Visual Warehouse', Icons.visibility, 7, '/visual-warehouse'),
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
        child: Image.asset('assets/images/CONSTRUX-LOGO.png', width: 400.0),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, int index, String route) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300), // Durasi animasi transisi warna
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index ? AppColors.hijau : AppColors.abu,
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

  Widget _buildParentItem(String title, IconData icon, int index, List<Widget> subItems) {
    return Obx(() => Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == index ? AppColors.hijau : AppColors.abu,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                leading: Icon(icon, color: Colors.white),
                title: Text(title, style: const TextStyle(color: Colors.white)),
                trailing: Icon(controller.isExpanded(index) ? Icons.expand_less : Icons.expand_more, color: Colors.white),
                onTap: () {
                  controller.toggleExpand(index);
                  controller.selectItem(index);
                },
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300), // Durasi animasi untuk membuka/tutup sublist
              child: Column(
                children: controller.isExpanded(index) ? subItems : [],
              ),
            ),
          ],
        ));
  }

  Widget _buildSubItem(String title, IconData icon, int subIndex, String route) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(left: 40, top: 5),
          decoration: BoxDecoration(
            color: controller.selectedSubIndex.value == subIndex ? AppColors.putih : AppColors.abu,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(icon, color: controller.selectedSubIndex.value == subIndex ? Colors.black : Colors.white),
            title: Text(title, style: TextStyle(color: controller.selectedSubIndex.value == subIndex ? AppColors.textGelap : Colors.white)),
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
