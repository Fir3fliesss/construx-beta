import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/company_information_controller.dart';
import '../../sidebar/views/sidebar_view.dart';
import '../../../../constanta/app_colors.dart';

class CompanyInformationView extends GetView<CompanyInformationController> {
  const CompanyInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spasi tambahan di sini
                SizedBox(height: 40), // Sesuaikan dengan kebutuhan spasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Basic Setting',
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 760.0), // Spasi antara dua teks
                          Text(
                            'Basic Settings > Company Information',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0), // Spasi tambahan sebelum tabel
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          // Tambahkan logika untuk menambah item baru
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          // Tambahkan logika untuk refresh tabel
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.upload_outlined),
                        onPressed: () {
                          // Tambahkan logika untuk upload data
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('No')),
                          DataColumn(label: Text('Corporate Name')),
                          DataColumn(label: Text('City')),
                          DataColumn(label: Text('Detailed Address')),
                          DataColumn(label: Text('Person In Charge')),
                          DataColumn(label: Text('Contact Information')),
                          DataColumn(label: Text('Operate')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('A')),
                            DataCell(Text('Lorem Ipsum')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Tambahkan logika untuk edit data
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Tambahkan logika untuk hapus data
                                  },
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('B')),
                            DataCell(Text('Lorem Ipsum')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Tambahkan logika untuk edit data
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Tambahkan logika untuk hapus data
                                  },
                                ),
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('C')),
                            DataCell(Text('Lorem Ipsum')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Text('-')),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Tambahkan logika untuk edit data
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Tambahkan logika untuk hapus data
                                  },
                                ),
                              ],
                            )),
                          ]),
                        ],
                      ),
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
}