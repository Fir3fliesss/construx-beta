import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';

class PutOnShelfView extends StatelessWidget {
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
                              'Receiving Management > To Be Put On The Shelf',
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
                                    const Spacer(),
                                    Container(
                                      width: 200,
                                      height: 50,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Supplier Name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 16),
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
                                              color: Colors.grey, fontSize: 16),
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.all(12.0),
                                        ),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                                          label: Text('No',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text('')),
                                                      const DataColumn(
                                                          label: Text('ASN No',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Commodity\nCode',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Trade Name',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Specification\nCode',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'From\nName',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Goods Owner\nName',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Supplier\nName',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Asn\nQuantity',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text(
                                                              'Commodity\nPrice',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text('Weight',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text('Volume',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                      const DataColumn(
                                                          label: Text('Operate',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12))),
                                                    ],
                                                    rows: List.generate(
                                                      10,
                                                      (index) =>
                                                          DataRow(cells: [
                                                        DataCell(Text(
                                                            '${index + 1}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12))),
                                                        DataCell(Checkbox(
                                                            value: false,
                                                            onChanged: (bool?
                                                                value) {})),
                                                        const DataCell(Text(
                                                            '20240731-0001',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text(
                                                            '20240731-0001',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Text('-',
                                                            style: TextStyle(
                                                                fontSize: 12))),
                                                        const DataCell(Icon(
                                                            Icons
                                                                .share_outlined,
                                                            color: AppColors
                                                                .textGelap,
                                                            size: 16)),
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
