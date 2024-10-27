import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import '../controllers/warehouse_processing_controller.dart';

class WarehouseProcessingView extends StatelessWidget {
  final WarehouseProcessingController controller =
      Get.put(WarehouseProcessingController());

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
                        'Warehouse Working',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Warehouse Working > Warehouse Processing',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

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
                                    hintText: 'Job Name',
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
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: double.infinity,
                            maxHeight: 500,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: DataTable(
                                headingRowColor:
                                    WidgetStateProperty.all(Colors.grey[200]),
                                columnSpacing: 20,
                                columns: const [
                                  const DataColumn(label: Text('No')),
                                  const DataColumn(label: Text('')),
                                  const DataColumn(label: Text('Job Code')),
                                  const DataColumn(label: Text('Job Type')),
                                  const DataColumn(
                                      label: Text('Is Update Stock')),
                                  const DataColumn(label: Text('Processor')),
                                  const DataColumn(label: Text('Process Time')),
                                  const DataColumn(label: Text('Creator')),
                                  const DataColumn(label: Text('Creator Time')),
                                  const DataColumn(label: Text('Operator'))
                                ],
                                rows: List.generate(
                                  15,
                                  (index) => DataRow(cells: [
                                    DataCell(Text('${index + 1}')),
                                    DataCell(Checkbox(
                                        value: false,
                                        onChanged: (bool? value) {})),
                                    const DataCell(Text('20240731-0001')),
                                    const DataCell(Text('20240731-0001')),
                                    const DataCell(Text('-')),
                                    const DataCell(Text('-')),
                                    const DataCell(Text('-')),
                                    const DataCell(Text('-')),
                                    const DataCell(Text('-')),
                                    const DataCell(
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.visibility,
                                              color: AppColors.textGelap,
                                              size: 16),
                                          SizedBox(width: 4),
                                          Icon(Icons.copy,
                                              color: AppColors.abu, size: 16),
                                          SizedBox(width: 4),
                                          Icon(Icons.book, color: AppColors.abu, size: 16),
                                          SizedBox(width: 4.0,),
                                          Icon(Icons.delete, color: AppColors.abu, size: 16),
                                        ],
                                      ),
                                    ),
                                  ]),
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