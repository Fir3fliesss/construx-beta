import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';

class ToBeUnloadedView extends StatelessWidget {
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
                              'Receiving Management > To Be Unloaded',
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
                                  ],
                                ),
                              ),

                              // Data table
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    // Set the threshold width to trigger horizontal scrolling
                                    bool isSmallScreen =
                                        constraints.maxWidth < 1000;
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
                                                padding:
                                                    const EdgeInsets.all(20.0),
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
                                                      const DataColumn(
                                                          label: Text('')),
                                                      const DataColumn(
                                                          label: Text('No')),
                                                      const DataColumn(
                                                          label:
                                                              Text('ASN No')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Commodity Code')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Trade Name')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Specification Code')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'From Name')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Goods Owner Name')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Supplier Name')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'ASN Quantity')),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Commodity Price')),
                                                      const DataColumn(
                                                          label:
                                                              Text('Weight')),
                                                      const DataColumn(
                                                          label:
                                                              Text('Volume')),
                                                    ],
                                                    rows: List.generate(
                                                      15,
                                                      (index) =>
                                                          DataRow(cells: [
                                                        DataCell(Checkbox(
                                                            value: false,
                                                            onChanged: (bool?
                                                                value) {})),
                                                        DataCell(Text(
                                                            '${index + 1}')),
                                                        DataCell(Text(
                                                            '20240731-000${index % 10 + 1}')), // ASN No
                                                        DataCell(Text(
                                                            'CC${index + 1}')), // Commodity Code
                                                        DataCell(Text(
                                                            'Trade Name ${index + 1}')), // Trade Name
                                                        DataCell(Text(
                                                            'Spec Code ${index + 1}')), // Specification Code
                                                        DataCell(Text(
                                                            'From Name ${index + 1}')), // From Name
                                                        DataCell(Text(
                                                            'Goods Owner ${index + 1}')), // Goods Owner Name
                                                        DataCell(Text(
                                                            '${(index + 1) * 10}')), // ASN Quantity
                                                        DataCell(Text(
                                                            '\$${(index + 1) * 100}')), // Commodity Price
                                                        DataCell(Text(
                                                            '${(index + 1) * 5} kg')), // Weight
                                                        DataCell(Text(
                                                            '${(index + 1) * 0.5} m³')), // Volume
                                                        DataCell(Text(
                                                            '${(index + 1) * 0.5} m³')), // Volume
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
