import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/warehouse_settings/controllers/warehouse_settings_controller.dart';

class CommodityManagementView extends StatelessWidget {
  final WarehouseSettingsController controller = Get.put(WarehouseSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Basic Setting',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > Commodity Management',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),

                // Container for table and actions
                Expanded(
                  child: Container(
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
                              buildCircleIconButton(Icons.add_circle_outline, "Add", AppColors.abuabu),
                              const SizedBox(width: 16),
                              buildCircleIconButton(Icons.refresh, "Refresh", AppColors.abuabu),
                              const SizedBox(width: 16),
                              buildCircleIconButton(Icons.upload_outlined, "Upload", AppColors.abuabu),
                            ],
                          ),
                        ),

                        // Data table with smaller column spacing
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DataTable(
                              headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
                              columnSpacing: 5, // Kurangi jarak antar kolom
                              columns: [
                                DataColumn(label: wrapHeaderText('No', 40)), // Lebar lebih kecil untuk kolom No
                                DataColumn(label: wrapHeaderText('Commodity Code', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Name', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Category', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Description', 80)),
                                DataColumn(label: wrapHeaderText('Supplier Name', 80)),
                                DataColumn(label: wrapHeaderText('Brand', 80)),
                                DataColumn(label: wrapHeaderText('Specification Code', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Weight', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Length', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Width', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Height', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Volume', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Cost', 80)),
                                DataColumn(label: wrapHeaderText('Commodity Price', 80)),
                                DataColumn(label: wrapHeaderText('Operation', 80)),
                              ],
                              rows: List.generate(
                                10,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(Text('${index + 1}', style: TextStyle(fontSize: 10))), // No
                                    DataCell(wrapTextCell('CODE${index + 100}', 80)), // Commodity Code
                                    DataCell(wrapTextCell('Commodity Name ${index + 1}', 80)), // Commodity Name
                                    DataCell(wrapTextCell('Category ${index + 1}', 80)), // Commodity Category
                                    DataCell(wrapTextCell('Description of the commodity ${index + 1} that is longer', 80)), // Commodity Description
                                    DataCell(wrapTextCell('Supplier ${index + 1}', 80)), // Supplier Name
                                    DataCell(wrapTextCell('Brand ${index + 1}', 80)), // Brand
                                    DataCell(wrapTextCell('SPEC${index + 100}', 80)), // Specification Code
                                    DataCell(wrapTextCell('${index + 10} kg', 80)), // Commodity Weight
                                    DataCell(wrapTextCell('${index + 5} cm', 80)), // Commodity Length
                                    DataCell(wrapTextCell('${index + 2} cm', 80)), // Commodity Width
                                    DataCell(wrapTextCell('${index + 3} cm', 80)), // Commodity Height
                                    DataCell(wrapTextCell('${(index + 5) * (index + 2)} cm³', 80)), // Commodity Volume
                                    DataCell(wrapTextCell('\$${(index + 1) * 50}', 80)), // Commodity Cost
                                    DataCell(wrapTextCell('\$${(index + 1) * 100}', 80)), // Commodity Price
                                    DataCell(
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.edit, color: Colors.blue, size: 15),
                                          SizedBox(width: 15.0),
                                          Icon(Icons.delete, color: Colors.red, size: 15),
                                        ],
                                      ),
                                    ), // Operation (Edit/Delete)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


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


  Widget wrapTextCell(String text, double width) {
    return SizedBox(
      width: width,
        child: Text(
        text,
        softWrap: true,
        maxLines: null,
        overflow: TextOverflow.visible,
        style: TextStyle(fontSize: 10),
      ),
    );
  }

  Widget wrapHeaderText(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        softWrap: true,
        maxLines: null,
        overflow: TextOverflow.visible,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
