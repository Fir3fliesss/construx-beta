import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../company_information/controllers/company_information_controller.dart';
import '../../../../constanta/app_colors.dart';

class CompanyInformationView extends GetView<CompanyInformationController> {
  const CompanyInformationView({super.key});

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
                        'Basic Setting',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Basic Settings > Company Information',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.abuabu,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.abuabu,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.black,
                                onPressed: controller.showAddCompanyDialog,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.abuabu,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.refresh),
                                color: Colors.black,
                                onPressed: () {
                                  controller.companies.refresh();
                                },
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
                                onPressed: () {
                                  controller.exportCompanies();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          maxHeight: 500,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Obx(() {
                              return DataTable(
                                headingRowColor:
                                    WidgetStateProperty.all(AppColors.abuabu),
                                columns: const [
                                  DataColumn(label: Text('No')),
                                  DataColumn(label: Text('Corporate Name')),
                                  DataColumn(label: Text('City')),
                                  DataColumn(label: Text('Detailed Address')),
                                  DataColumn(label: Text('Person In Charge')),
                                  DataColumn(
                                      label: Text('Contact Information')),
                                  DataColumn(label: Text('Operate')),
                                ],
                                rows: controller.companies.map((company) {
                                  return DataRow(
                                    cells: [
                                      DataCell(Text(company.id.toString())),
                                      DataCell(Text(company.name)),
                                      DataCell(Text(company.city)),
                                      DataCell(Text(company.address)),
                                      DataCell(
                                          Text(company.personInCharge)),
                                      DataCell(
                                          Text(company.contactInfo)),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () =>
                                                controller.editCompany(company),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete, color: Color(0xFFD32F2F),),
                                            onPressed: () => controller
                                                .deleteCompany(company),
                                          ),
                                        ],
                                      )),
                                    ],
                                  );
                                }).toList(),
                                border: const TableBorder(
                                  bottom: BorderSide(
                                      width: 2, color: AppColors.abuabu),
                                      left: BorderSide(width: 2, color: AppColors.abuabu),
                                      right: BorderSide(width: 2, color: AppColors.abuabu),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
