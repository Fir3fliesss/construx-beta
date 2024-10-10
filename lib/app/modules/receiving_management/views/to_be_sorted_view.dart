import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';

class ToBeSortedView extends StatelessWidget {
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
                              'Receiving Management > To Be Sorted',
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
                                      child: TextField(
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
                                      child: TextField(
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
                              headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                              columnSpacing: 10,
                              columns: [
                              DataColumn(label: Text('No', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('ASN No', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Commodity\nCode', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Trade Name', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Specification\nCode', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('From\nName', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Goods Owner\nName', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Supplier\nName', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Asn\nQuantity', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Commodity\nPrice', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Weight', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Volume', style: TextStyle(fontSize: 12))),
                              DataColumn(label: Text('Operate', style: TextStyle(fontSize: 12))),
                            ],
                            rows: List.generate(
                              10,
                              (index) => DataRow(cells: [
                                DataCell(Text('${index + 1}', style: TextStyle(fontSize: 12))),
                                DataCell(Checkbox(value: false, onChanged: (bool? value) {})),
                                DataCell(Text('20240731-0001', style: TextStyle(fontSize: 12))),
                                DataCell(Text('20240731-0001', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(Text('-', style: TextStyle(fontSize: 12))),
                                DataCell(
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, color: AppColors.textGelap, size: 16),
                                      SizedBox(width: 4),
                                      Icon(Icons.edit, color: Colors.blue, size: 16),
                                      SizedBox(width: 4),
                                      Icon(Icons.delete, color: Colors.red, size: 16),
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
