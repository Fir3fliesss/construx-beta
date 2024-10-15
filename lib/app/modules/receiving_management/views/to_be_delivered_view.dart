import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';

class ToBeDeliveredView extends StatelessWidget {
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
                              'Receiving Management > To Be Delivered',
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
                          padding: const EdgeInsets.all(5.0), // Updated padding
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
                                        textAlignVertical:
                                            TextAlignVertical.center,
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
                                            fontSize:
                                                16, // Sesuaikan ukuran font
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
                                          Colors.grey[200]),
                                      columnSpacing:
                                          10, // Adjust column spacing
                                      columns: [
                                        const DataColumn(label: Text('')),
                                        const DataColumn(label: Text('No')),
                                        const DataColumn(label: Text('ASN No')),
                                        const DataColumn(
                                            label: Text('Commodity Code')),
                                        const DataColumn(label: Text('Trade Name')),
                                        const DataColumn(
                                            label: Text('Specification Code')),
                                        const DataColumn(label: Text('From Name')),
                                        const DataColumn(
                                            label: Text('Goods Owner Name')),
                                        const DataColumn(
                                            label: Text('Supplier Name')),
                                        const DataColumn(label: Text('Asn Quantity')),
                                        const DataColumn(
                                            label: Text('Commodity Price')),
                                        const DataColumn(label: Text('Weight')),
                                        const DataColumn(label: Text('Volume')),
                                      ],
                                      rows: List.generate(
                                        15,
                                        (index) => DataRow(cells: [
                                          DataCell(Checkbox(
                                              value: false,
                                              onChanged: (bool? value) {})),
                                          DataCell(Text('${index + 1}')),
                                          const DataCell(Text('20240731-0001')),
                                          const DataCell(Text('20240731-0001')),
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
