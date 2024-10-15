import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';

class ReceiptDetailsView extends StatelessWidget {
  final ReceivingManagementController controller =
      Get.put(ReceivingManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
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
                              'Receiving Management',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Receiving Management > Receipt Details',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TabButtons(),
                      ),
                      const SizedBox(height: 16.0),

                      // Container for table and actions
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.abuabu, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    buildCircleIconButton(
                                        Icons.add_circle_outline,
                                        'Add',
                                        AppColors.abuabu),
                                    const SizedBox(width: 16),
                                    buildCircleIconButton(Icons.refresh,
                                        'Refresh', AppColors.abuabu),
                                    const SizedBox(width: 16),
                                    buildCircleIconButton(Icons.upload_outlined,
                                        'Upload', AppColors.abuabu),
                                  ],
                                ),
                              ),

                              // Data table
                              Container(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                  maxHeight: 500,
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: DataTable(
                                      headingRowColor: WidgetStateProperty.all(
                                          AppColors.abuabu),
                                      columnSpacing: 10,
                                      columns: [
                                        const DataColumn(
                                            label: Text('No',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(label: Text('')),
                                        const DataColumn(
                                            label: Text('ASN No',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Commodity Code',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Trade Name',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Specification Code',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('From Name',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Goods Owner Name',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Supplier Name',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('ASN Quantity',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Weight',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Volume',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Actual\nQuantity',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Sorted\nQuantity',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Shortage\nQuantity',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                        const DataColumn(
                                            label: Text('Damage\nQuantity',
                                                style:
                                                    TextStyle(fontSize: 12))),
                                      ],
                                      rows: List.generate(
                                        10,
                                        (index) => DataRow(cells: [
                                          DataCell(Text('${index + 1}')),
                                          DataCell(Checkbox(
                                              value: false,
                                              onChanged: (bool? value) {})),
                                          DataCell(
                                              Text('20240713-000${index + 1}')),
                                          const DataCell(Text('20240713-0001')),
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
                                          const DataCell(Text('-')),
                                          const DataCell(Text('-')),
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
