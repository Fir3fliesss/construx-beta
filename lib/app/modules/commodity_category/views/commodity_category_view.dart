import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commodity_category/controllers/commodity_category_controller.dart';
import '../../../../constanta/app_colors.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class CommodityCategoryView extends GetView<CommodityCategoryController> {
  const CommodityCategoryView({super.key});

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
                    border: Border.all(
                      color: AppColors.abuabu,
                      width: 2,
                    ),
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
                              onPressed: ()=>{},
                            ),
                            const SizedBox(width: 16),
                            buildCircleIconButton(
                              icon: Icons.refresh,
                              onPressed: () => controller.categories.refresh(),
                            ),
                            const SizedBox(width: 16),
                            buildCircleIconButton(
                              icon: Icons.upload_outlined,
                              onPressed: controller.exportCategories,
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
                          // scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Obx(() {
                                return DataTable(
                                  headingRowColor: MaterialStateProperty.all(AppColors.abuabu),
                                  columns: const [
                                    DataColumn(label: Text('No')),
                                    DataColumn(label: Text('Commodity Category')),
                                    DataColumn(label: Text('Creator')),
                                    DataColumn(label: Text('Creation Time')),
                                    DataColumn(label: Text('Operate')),
                                  ],
                                  rows: controller.categories.map((category) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text(category.no.toString())),
                                        DataCell(Text(category.commodityCategory ?? '-')),
                                        DataCell(Text(category.creator ?? '-')),
                                        DataCell(Text(category.createTime ?? '-')),
                                        DataCell(Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () => controller.editCategory(category),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete, color: Color(0xFFD32F2F)),
                                              onPressed: () => controller.deleteCategory(category),
                                            ),
                                          ],
                                        )),
                                      ],
                                    );
                                  }).toList(),
                                  border: const TableBorder(
                                    bottom: BorderSide(width: 2, color: AppColors.abuabu),
                                    left: BorderSide(width: 2, color: AppColors.abuabu),
                                    right: BorderSide(width: 2, color: AppColors.abuabu),
                                  ),
                                );
                              }),
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

  // Circular IconButton builder
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
