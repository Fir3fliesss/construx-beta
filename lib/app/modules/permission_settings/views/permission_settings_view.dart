import 'package:flutter/material.dart';

class PermissionSettingsView extends StatelessWidget {
  const PermissionSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 32.0),
          // Header section with title and path
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  'Basic Setting',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          _buildIconButton(Icons.add_circle_outline, 'Add'),
                          const SizedBox(width: 16),
                          _buildIconButton(Icons.edit, 'Edit'),
                          const SizedBox(width: 16),
                          _buildIconButton(Icons.upload_file, 'Upload'),
                          const SizedBox(width: 16),
                          _buildIconButton(Icons.delete, 'Delete'),
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
                              child: DataTable(
                                headingRowHeight: 40,
                                headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Menu Name Table
                            Expanded(
                              flex: 3,
                              child: DataTable(
                                headingRowHeight: 40,
                                headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Menu Item ${index + 1}'),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      )),
                                      DataCell(Icon(
                                        Icons.edit,
                                        color: Colors.grey[600],
                                      )),
                                    ],
                                  );
                                }),
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

  // Helper function for building icon buttons
  Widget _buildIconButton(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
    );
  }
}
