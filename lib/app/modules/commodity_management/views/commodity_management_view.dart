import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/commodity_management/controllers/commodity_management_controller.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class CommodityManagementView extends StatelessWidget {
  final CommodityManagementController controller = Get.put(CommodityManagementController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Basic Settings",
      menuSubName: "Commodity Category",
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
                        'Commodity Categories',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > Commodity Categories',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.abuabu, width: 2),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            buildCircleIconButton(
                              icon: Icons.add_circle_outline,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 16),
                            buildCircleIconButton(
                              icon: Icons.refresh,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 16),
                            buildCircleIconButton(
                              icon: Icons.upload_outlined,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          maxHeight: 500,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DataTable(
                                headingRowColor: MaterialStateProperty.all(AppColors.abuabu),
                                columns: [
                                  DataColumn(label: Text('No', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Code', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Name', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Category', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Description', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Supplier Name', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Brand', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Specification Code', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Weight', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Length', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Width', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Height', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Volume', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Cost', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Commodity Price', style: TextStyle(fontSize: 12))),
                                  DataColumn(label: Text('Operation', style: TextStyle(fontSize: 12))),
                                ],
                                rows: List.generate(
                                  10,
                                  (index) => DataRow(
                                    cells: [
                                      DataCell(Text('${index + 1}', style: const TextStyle(fontSize: 10))),
                                      DataCell(Text('CODE${index + 100}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('Commodity Name ${index + 1}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('Category ${index + 1}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('Description of the commodity ${index + 1} that is longer', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('Supplier ${index + 1}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('Brand ${index + 1}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('SPEC${index + 100}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('${index + 10} kg', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('${index + 5} cm', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('${index + 2} cm', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('${index + 3} cm', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('${(index + 5) * (index + 2)} cm³', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('\$${(index + 1) * 50}', style: TextStyle(fontSize: 12))),
                                      DataCell(Text('\$${(index + 1) * 100}', style: TextStyle(fontSize: 12))),
                                      const DataCell(
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.edit, color: Colors.blue, size: 15),
                                            SizedBox(width: 15.0),
                                            Icon(Icons.delete, color: Colors.red, size: 15),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                border: TableBorder(
                                  bottom: BorderSide(width: 2, color: AppColors.abuabu),
                                  left: BorderSide(width: 2, color: AppColors.abuabu),
                                  right: BorderSide(width: 2, color: AppColors.abuabu),
                                ),
                              ),
                            ),
                          ),
                        ),
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

  Widget buildCircleIconButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.abuabu,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
