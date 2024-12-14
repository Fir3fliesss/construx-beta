import 'package:construx_beta/app/modules/inventory_adjust/controllers/inventory_adjust_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class InventoryAdjustView extends GetView<InventoryAdjustController> {
  const InventoryAdjustView({super.key});
 @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: 'Warehouse Working',
      menuSubName: 'Inventory Freeze',
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Warehouse Working',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Warehouse Working > Inveentory Adjust',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                // Container for table and actions
                Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.abuabu, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Action Buttons
                            buildCircleIconButton(Icons.add_circle_outline,
                                "Add", AppColors.abuabu),
                            const SizedBox(width: 16),
                            buildCircleIconButton(
                                Icons.refresh, "Refresh", AppColors.abuabu),
                            const SizedBox(width: 16),
                            buildCircleIconButton(Icons.upload_outlined,
                                "Upload", AppColors.abuabu),
                            const SizedBox(
                              width: 16,
                            ),
                            buildCircleIconButton(Icons.bar_chart,
                                "Statistic", AppColors.abuabu),
                            const SizedBox(
                              width: 16,
                            ),
                            buildCircleIconButton(Icons.bar_chart,
                                "Statistic", AppColors.abuabu),
                            const SizedBox(
                              width: 16,
                            ),
                            buildCircleIconButton(Icons.bar_chart,
                                "Statistic", AppColors.abuabu),
                            const Spacer(),

                            Container(
                              width: 200,
                              height: 50,
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Job No',
                                  hintStyle: TextStyle(
                                    color: AppColors
                                        .abu, // Kamu bisa ubah warna atau gaya teks hint di sini
                                    fontSize: 16, // Sesuaikan ukuran font
                                  ),
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(
                                      12.0), // Tetap penting untuk menyesuaikan padding
                                ),
                                textAlignVertical: TextAlignVertical
                                    .center, // Pastikan teks di tengah vertikal
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Data table with wrapped text in header
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Set the threshold width to trigger horizontal scrolling
                          bool isSmallScreen = constraints.maxWidth < 1000;
                          return Container(
                            constraints: BoxConstraints(
                              minWidth: double.infinity,
                              maxHeight: 500,
                            ),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: isSmallScreen
                                        ? Axis.horizontal
                                        : Axis.vertical,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: isSmallScreen
                                              ? 1000
                                              : constraints.maxWidth,
                                        ),
                                        child: DataTable(
                                          headingRowColor:
                                              WidgetStateProperty.all(
                                                  Colors.grey[200]),
                                          columnSpacing: 50,
                                          columns: [
                                            const DataColumn(
                                                label: Text('No',
                                                    style: TextStyle(
                                                        fontSize: 10))),
                                            const DataColumn(
                                                label: Text('')),
                                            const DataColumn(
                                                label: Text('Job Code')),
                                            const DataColumn(
                                                label: Text('Job Type')),
                                            const DataColumn(
                                                label: Text(
                                                    'Commodity Code',)),
                                            const DataColumn(
                                                label: Text(
                                                    'Commodity Name',)),
                                            const DataColumn(
                                                label: Text('Speecification Code')),
                                            const DataColumn(
                                                label: Text(
                                                    'Difference Qty',)),
                                            const DataColumn(
                                                label: Text(
                                                    'WareHouse',)),
                                            const DataColumn(
                                                label: Text(
                                                    'Location Code',)),
                                            const DataColumn(
                                                label: Text(
                                                    'Creator',)),
                                            const DataColumn(
                                                label: Text(
                                                    'Create Time',)),
                                             ],
                                          rows: List.generate(
                                            15,
                                            (index) => DataRow(cells: [
                                              DataCell(
                                                  Text('${index + 1}')),
                                              DataCell(Checkbox(
                                                  value: false,
                                                  onChanged:
                                                      (bool? value) {})),
                                              const DataCell(
                                                  Text('20240731-0001')),
                                              const DataCell(
                                                  Text('20240731-0001')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                              const DataCell(Text('-')),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Circular IconButton for action buttons
  Widget buildCircleIconButton(IconData icon, String tooltip, Color bgColor) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {},
        ),
      ),
    );
  }
}
