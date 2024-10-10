import 'package:construx_beta/constanta/app_colors.dart';
import 'package:flutter/material.dart';

class PermissionSettingsView extends StatelessWidget {
  const PermissionSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 32.0),
          // Header section with title and path
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Basic Setting',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'Basic Settings > Permission settings',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Container with actions and tables
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.abuabu, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row with action icons
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.black,
                                onPressed: () {}),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black,
                              onPressed: () {},
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
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.abuabu,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Tables for User Role and Menu Name
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User Role Table
                            Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  headingRowHeight: 40,
                                  headingTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  headingRowColor:
                                      WidgetStateProperty.all(AppColors.abuabu),
                                  dataTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  columns: const [
                                    DataColumn(
                                      label: Text('User Role'),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(5, (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Lorem Ipsum'),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.grey[400],
                                            ),
                                          ],
                                        )),
                                      ],
                                    );
                                  }),
                                  border: const TableBorder(
                                    bottom: BorderSide(
                                        width: 2, color: AppColors.abuabu),
                                    left: BorderSide(
                                        width: 2, color: AppColors.abuabu),
                                    right: BorderSide(
                                        width: 2, color: AppColors.abuabu),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Menu Name Table
                            Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: DataTable(
                                  headingRowHeight: 40,
                                  headingTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  headingRowColor:
                                      WidgetStateProperty.all(AppColors.abuabu),
                                  dataTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  columns: const [
                                    DataColumn(
                                      label: Text('Menu Name'),
                                    ),
                                    DataColumn(
                                      label: Text('Operate'),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(20, (index) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.grey[400],
                                            ),
                                            Text('Menu Item ${index + 1}'),
                                          ],
                                        )),
                                        DataCell(Icon(
                                          Icons.edit,
                                          color: Colors.grey[600],
                                        )),
                                      ],
                                    );
                                  }),
                                  border: const TableBorder(
                                    bottom: BorderSide(
                                        width: 2, color: AppColors.abuabu),
                                    left: BorderSide(
                                        width: 2, color: AppColors.abuabu),
                                    right: BorderSide(
                                        width: 2, color: AppColors.abuabu),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
