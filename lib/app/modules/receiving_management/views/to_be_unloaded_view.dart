import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/modules/receiving_management/controllers/receiving_management_controller.dart';
import 'package:construx_beta/constanta/app_colors.dart';
import 'package:construx_beta/app/modules/receiving_management/views/tab_button.dart';
import 'package:construx_beta/app/modules/layout_sidebar/layout.dart';
import 'package:construx_beta/app/modules/layout_sidebar/sidemenu_dashboard.dart';

class ToBeUnloadedView extends StatelessWidget {
  final ReceivingManagementController controller =
      Get.put(ReceivingManagementController());

  @override
  Widget build(BuildContext context) {
    return Layout(
      menuItem: SidemenuDashboard(),
      menuName: "Receiving Management",
      menuSubName: "To Be Unloaded",
      child: Column(
        children: [
          Row(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: buildTabButton(0, "Notice Of Arrival",
                                  Icons.note, '/receiving-management')),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTabButton(1, "To be Delivered",
                                  Icons.local_shipping, '/to-be-delivered')),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTabButton(2, "To be Unloaded",
                                  Icons.unarchive, '/to-be-unloaded')),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTabButton(3, "To be Sorted",
                                  Icons.sort_outlined, '/to-be-sorted')),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTabButton(4, "To be Put On The Shelf",
                                  Icons.inventory, '/put-on-shelf')),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: buildTabButton(5, "Receipt Details",
                                  Icons.receipt, '/receipt-details')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
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
                                buildCircleIconButton(Icons.add_circle_outline,
                                    'Add', AppColors.abuabu),
                                const SizedBox(width: 16),
                                buildCircleIconButton(
                                    Icons.refresh, 'Refresh', AppColors.abuabu),
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
                                        color: AppColors.textGelap,
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
                                        color: AppColors.textGelap,
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(12.0),
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              bool isSmallScreen = constraints.maxWidth < 500;
                              return Container(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                  maxHeight: 500,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
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
                                              columns: const [
                                                DataColumn(label: Text('No')),
                                                DataColumn(label: Text('')),
                                                DataColumn(
                                                    label: Text('ASN No')),
                                                DataColumn(
                                                    label:
                                                        Text('Commodity Code')),
                                                DataColumn(
                                                    label: Text('Trade Name')),
                                                DataColumn(
                                                    label: Text(
                                                        'Specification Code')),
                                                DataColumn(
                                                    label: Text('From Name')),
                                                DataColumn(
                                                    label: Text(
                                                        'Goods Owner Name')),
                                                DataColumn(
                                                    label:
                                                        Text('Supplier Name')),
                                                DataColumn(
                                                    label:
                                                        Text('ASN Quantity')),
                                                DataColumn(
                                                    label: Text(
                                                        'Commodity Price')),
                                                DataColumn(
                                                    label: Text('Weight')),
                                                DataColumn(
                                                    label: Text('Volume')),
                                              ],
                                              rows: List.generate(
                                                15,
                                                (index) => DataRow(
                                                  cells: [
                                                    DataCell(
                                                        Text('${index + 1}')),
                                                    DataCell(Checkbox(
                                                      value: false,
                                                      onChanged:
                                                          (bool? value) {},
                                                    )),
                                                    DataCell(Text(
                                                        '20240731-000${index % 10 + 1}')),
                                                    DataCell(
                                                        Text('CC${index + 1}')),
                                                    DataCell(Text(
                                                        'Trade Name ${index + 1}')),
                                                    DataCell(Text(
                                                        'Spec Code ${index + 1}')),
                                                    DataCell(Text(
                                                        'From Name ${index + 1}')),
                                                    DataCell(Text(
                                                        'Goods Owner ${index + 1}')),
                                                    DataCell(Text(
                                                        'Supplier ${index + 1}')),
                                                    DataCell(Text(
                                                        '${(index + 1) * 10}')),
                                                    DataCell(Text(
                                                        '\$${(index + 1) * 100}')),
                                                    DataCell(Text(
                                                        '${(index + 1) * 5} kg')),
                                                    DataCell(Text(
                                                        '${(index + 1) * 0.5} m³')),
                                                  ],
                                                ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
