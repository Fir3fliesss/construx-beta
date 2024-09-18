import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/data/company_model.dart';
import '../../sidebar/controllers/loading_controller.dart';

class CompanyInformationController extends GetxController {
  final LoadingController loadingController = Get.find();
  var companies = <CompanyModel>[].obs;
  var selectedCompany = CompanyModel(
    id: 0,
    name: '',
    city: '',
    address: '',
    personInCharge: '',
    contactInfo: '',
  ).obs;

  final formKey = GlobalKey<FormState>();
// TODO: fix the loading bugs

@override
  Future<void> onInit() async {
    super.onInit();
    loadInitialData(); 
    // loadingController.triggerLoading();
  }
  void loadInitialData() {
    companies.assignAll([
      CompanyModel(
          id: 1,
          name: 'Lorem Ipsum',
          city: '-',
          address: '-',
          personInCharge: 'John Doe',
          contactInfo: 'john@example.com'),
      CompanyModel(
          id: 2,
          name: 'Dolor Sit',
          city: '-',
          address: '-',
          personInCharge: 'Jane Doe',
          contactInfo: 'jane@example.com'),
    ]);
  }

  void addCompany() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      companies.add(CompanyModel(
        id: companies.length + 1,
        name: selectedCompany.value.name,
        city: selectedCompany.value.city,
        address: selectedCompany.value.address,
        personInCharge: selectedCompany.value.personInCharge,
        contactInfo: selectedCompany.value.contactInfo,
      ));
      Get.back();
      Get.snackbar('Success', 'Company added successfully',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void editCompany(CompanyModel company) {
    selectedCompany.value = company;
    Get.defaultDialog(
      title: 'Edit Company',
      content: _buildCompanyForm(),
      textConfirm: 'Save',
      onConfirm: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          company.name = selectedCompany.value.name;
          company.city = selectedCompany.value.city;
          company.address = selectedCompany.value.address;
          company.personInCharge = selectedCompany.value.personInCharge;
          company.contactInfo = selectedCompany.value.contactInfo;
          companies.refresh();
          Get.back();
          Get.snackbar('Success', 'Company updated successfully',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      textCancel: 'Cancel',
    );
  }

  void deleteCompany(CompanyModel company) {
    Get.defaultDialog(
      title: 'Delete Company',
      middleText: 'Are you sure you want to delete ${company.name}?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: () {
        companies.remove(company);
        Get.back();
        Get.snackbar('Success', 'Company deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

Future<void> exportCompanies() async {
  try {
    var excel = Excel.createExcel();
    excel.rename(excel.getDefaultSheet()!, 'Company_Information');
    Sheet sheetObject = excel['Company_Information'];

    sheetObject.appendRow([
      TextCellValue('No'),
      TextCellValue('Corporate Name'),
      TextCellValue('City'),
      TextCellValue('Detailed Address'),
      TextCellValue('Person In Charge'),
      TextCellValue('Contact Information')
    ]);

    for (var company in companies) {
      sheetObject.appendRow([
        TextCellValue(company.id.toString()),
        TextCellValue(company.name),
        TextCellValue(company.city ?? '-'),
        TextCellValue(company.address ?? '-'),
        TextCellValue(company.personInCharge ?? '-'),
        TextCellValue(company.contactInfo ?? '-')
      ]);
    }

    var fileBytes = excel.save();
    if (fileBytes == null) {
      print('Error: File bytes are null');
      return;
    }

    var directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/company_information.xlsx');
    file.createSync(recursive: true);
    file.writeAsBytesSync(fileBytes);

    print('File saved to ${file.path}');
  } catch (e) {
    print('An error occurred: $e');
  }
}

  Widget _buildCompanyForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: selectedCompany.value.name,
            decoration: const InputDecoration(labelText: 'Company Name'),
            onSaved: (value) => selectedCompany.value.name = value!,
            validator: (value) =>
                value!.isEmpty ? 'Please enter the company name' : null,
          ),
          TextFormField(
            initialValue: selectedCompany.value.city,
            decoration: const InputDecoration(labelText: 'City'),
            onSaved: (value) => selectedCompany.value.city = value!,
          ),
          TextFormField(
            initialValue: selectedCompany.value.address,
            decoration: const InputDecoration(labelText: 'Detailed Address'),
            onSaved: (value) => selectedCompany.value.address = value!,
          ),
          TextFormField(
            initialValue: selectedCompany.value.personInCharge,
            decoration: const InputDecoration(labelText: 'Person In Charge'),
            onSaved: (value) => selectedCompany.value.personInCharge = value!,
            validator: (value) =>
                value!.isEmpty ? 'Please enter the person in charge' : null,
          ),
          TextFormField(
            initialValue: selectedCompany.value.contactInfo,
            decoration: const InputDecoration(labelText: 'Contact Information'),
            onSaved: (value) => selectedCompany.value.contactInfo = value!,
            validator: (value) =>
                value!.isEmpty ? 'Please enter contact information' : null,
          ),
        ],
      ),
    );
  }

  void showAddCompanyDialog() {
    selectedCompany.value = CompanyModel(
      id: 0,
      name: '',
      city: '',
      address: '',
      personInCharge: '',
      contactInfo: '',
    );
    Get.defaultDialog(
      title: 'Add Company',
      content: _buildCompanyForm(),
      textConfirm: 'Add',
      onConfirm: addCompany,
      textCancel: 'Cancel',
    );
  }
}
