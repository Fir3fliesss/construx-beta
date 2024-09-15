import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commodity_category/controllers/commodity_category_controller.dart';
import '../../../../constanta/app_colors.dart';

class CommodityCategoryView extends GetView<CommodityCategoryController> {
  const CommodityCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
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
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.abuabu,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.black,
                                onPressed: controller.showAddCategoryDialog,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.abuabu,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.refresh),
                                color: Colors.black,
                                onPressed: () {
                                  controller.categories.refresh();
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.abuabu,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.upload_outlined),
                                color: Colors.black,
                                onPressed: () {
                                  controller.exportCategories();
                                },
                              ),
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
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Obx(() {
                              return DataTable(
                                headingRowColor:
                                    WidgetStateProperty.all(AppColors.abuabu),
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
                                            onPressed: () =>
                                                controller.editCategory(category),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete, color: Color(0xFFD32F2F),),
                                            onPressed: () => controller
                                                .deleteCategory(category),
                                          ),
                                        ],
                                      )),
                                    ],
                                  );
                                }).toList(),
                                border: const TableBorder(
                                  bottom: BorderSide(
                                      width: 2, color: AppColors.abuabu),
                                      left: BorderSide(width: 2, color: AppColors.abuabu),
                                      right: BorderSide(width: 2, color: AppColors.abuabu),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
