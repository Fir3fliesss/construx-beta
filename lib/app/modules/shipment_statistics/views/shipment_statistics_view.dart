import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import '../controllers/shipment_statistics_controller.dart';

class ShipmentStatisticsView extends StatelessWidget {
  final ShipmentStatisticsController controller =
      Get.put(ShipmentStatisticsController());

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
                        'Statistic Analysis',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Statistic Analysis > Shipment Statistic',
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
                              const Spacer(),
                              Container(
                                width: 200,
                                height: 50,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Supplier Name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(12.0),
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 200,
                                height: 50,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Form Name',
                                    hintStyle: TextStyle(
                                      color: Colors
                                          .grey, // Kamu bisa ubah warna atau gaya teks hint di sini
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
                        Expanded(
                          child: LayoutBuilder(
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
                                              columnSpacing: 10,
                                              columns: [
                                                DataColumn(
                                                  label: Text('No',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Shipment No',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Warehouse\nName',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Location Code',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Commodity\nCode',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Commodity\nName',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Specification\nCode',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Specification\nName',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Customer\nName',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Serial\nNumber',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Delivery\nQuantity',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('Delivery\nTime',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Commodity\nPrice',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                      'Expiration\nDate',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                DataColumn(
                                                  label: Text('listing\nDate',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                              ],
                                              rows: List.generate(
                                                15,
                                                (index) => DataRow(cells: [
                                                  DataCell(Center(
                                                      child: Text(
                                                          '${index + 1}'))),
                                                  const DataCell(Center(
                                                      child: Text(
                                                          '20240824-0003'))),
                                                  const DataCell(
                                                      Text('20240824-0003')),
                                                  DataCell(Text(index < 2
                                                      ? '${333 + index}'
                                                      : '3433')),
                                                  const DataCell(
                                                      Text('2024-08-1')),
                                                  const DataCell(Text('-')),
                                                  const DataCell(Text('-')),
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
