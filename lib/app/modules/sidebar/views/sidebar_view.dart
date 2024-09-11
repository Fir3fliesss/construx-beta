import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/sidebar/controllers/sidebar_controller.dart';
import '../../../../constanta/app_colors.dart';

class Sidebar extends StatelessWidget {
  final SidebarController controller = Get.put(SidebarController()); // Inisialisasi controller GetX untuk sidebar
  Sidebar({super.key});

  @override
  Widget build(BuildContext context) {

    //gilakk niat bet gua bikin komentar segala yakkk anying
    return Container(
      width: 300,
      color: AppColors.abu, // Warna background sidebar
      child: Column(
        children: [
          _buildDrawerHeader(), // Bagian header sidebar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildListTile('Home Page', Icons.home, 0, '/home'), // Item Home Page
                  _buildParentItem('Basic Settings', Icons.settings, 1, [
                    _buildSubItem('Company Information', Icons.info, 1, '/company-information'), // Sub-item untuk Basic Settings :v
                    _buildSubItem('User Role', Icons.person, 2, '/user-role'),
                    _buildSubItem('Commodity Category', Icons.category_outlined, 3, '/commodity-category'),
                  ]),
                  _buildListTile('Receiving Management', Icons.notifications, 2, '/receiving-management'),
                  _buildListTile('Stock Management', Icons.inventory_2, 3, '/stock-management'),
                  _buildParentItem('Statistic Analysis', Icons.analytics, 4, [
                    _buildSubItem('Safety Stock', Icons.security, 4, '/safety-stock'), // Sub-item untuk Statistic Analysis :v
                    _buildSubItem('Receiving Statistics', Icons.trending_up, 5, '/receiving-statistics'),
                    _buildSubItem('Shipment Statistics', Icons.local_shipping, 6, '/shipment-statistics'),
                  ]),
                  _buildParentItem('Warehouse Working', Icons.warehouse, 5, [
                    _buildSubItem('Warehouse Processing', Icons.autorenew, 7, '/warehouse-processing'), // Sub-item untuk Warehouse Working :v
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
          _buildBackButton(), // Tombol back di bagian paling bawah 
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      child: Center(
        child: Image.asset('assets/images/CONSTRUX-LOGO.png', width: 400.0), // Logo di bagian header
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, int index, String route) {
    return Obx(() => _buildContainer(
          ListTile(
            leading: Icon(icon, color: Colors.white), // Ikon di samping title
            title: Text(title, style: const TextStyle(color: Colors.white)), // Title item
            onTap: () {
              controller.selectItem(index); // Set item yang dipilih
              controller.selectSubItem(-1); // Reset sub-item yang dipilih
              controller.navigateWithDelay(route); // Navigasi dengan delay "lama bjir"
            },
          ),
          index,
        ));
  }

  Widget _buildParentItem(String title, IconData icon, int index, List<Widget> subItems) {
    return Obx(() => Column(
          children: [
            _buildContainer(
              ListTile(
                leading: Icon(icon, color: Colors.white), // Ikon untuk parent item
                title: Text(title, style: const TextStyle(color: Colors.white)), // Title parent item
                trailing: Icon(controller.isExpanded(index) ? Icons.expand_less : Icons.expand_more, color: Colors.white), // Ikon expand/collapse
                onTap: () {
                  controller.toggleExpand(index); // Toggle expand/collapse state
                  controller.selectItem(index); // Set item utama yang dipilih
                },
              ),
              index,
            ),
            if (controller.isExpanded(index)) ...subItems // Menampilkan sub-item jika parent item terbuka
          ],
        ));
  }

  Widget _buildSubItem(String title, IconData icon, int subIndex, String route) {
    return Obx(() => Container(
          margin: const EdgeInsets.only(left: 40, top: 5), // Margin untuk sub-item
          decoration: BoxDecoration(
            color: controller.selectedSubIndex.value == subIndex ? AppColors.putih : AppColors.abu, // Warna latar sub-item
            borderRadius: BorderRadius.circular(8), // Border radius untuk sudut sub-item
          ),
          child: ListTile(
            leading: Icon(icon, color: controller.selectedSubIndex.value == subIndex ? Colors.black : Colors.white), // Ikon untuk sub-item
            title: Text(title, style: TextStyle(color: controller.selectedSubIndex.value == subIndex ? AppColors.textGelap : Colors.white)), // Title sub-item
            onTap: () {
              controller.selectSubItem(subIndex); // Set sub-item yang dipilih
              controller.navigateWithDelay(route); // Navigasi dengan delay
            },
          ),
        ));
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16), // Padding tombol back agar tidak terlalu mepet
      child: ElevatedButton.icon(
        onPressed: () => Get.back(), // Kembali ke halaman sebelumnya
        icon: const Icon(Icons.arrow_back, color: AppColors.putih,),
        label: const Text('Back', style: TextStyle(color: AppColors.putih),),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.abuGelap, // Warna background tombol back
          minimumSize: const Size.fromHeight(50), // Ukuran minimal tombol
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Hapus border radius untuk tombol biar kotak anjayyy
        ),
      ),
    );
  }

  Widget _buildContainer(Widget child, int index) {
    return Container(
      decoration: BoxDecoration(
        color: controller.selectedIndex.value == index ? AppColors.hijau : AppColors.abu, // Warna latar berdasarkan item yang dipilih
        borderRadius: BorderRadius.circular(8.0), // Border radius untuk sudut item
      ),
      child: child,
    );
  }
}
