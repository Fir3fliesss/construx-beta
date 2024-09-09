import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:construx_beta/app/data/commodity_category_model.dart';

class CommodityCategoryController extends GetxController {
  var categories = <CommodityCategoryModel>[].obs;
  var selectedCategory = CommodityCategoryModel().obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  void loadInitialData() {
    categories.assignAll([
      CommodityCategoryModel(
        no: 1,
        commodityCategory: 'Electronics',
        creator: 'Admin',
        createTime: DateTime.now().toString(),
      ),
      CommodityCategoryModel(
        no: 2,
        commodityCategory: 'Furniture',
        creator: 'Admin',
        createTime: DateTime.now().toString(),
      ),
    ]);
  }

  void addCategory() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      categories.add(CommodityCategoryModel(
        no: categories.length + 1,
        commodityCategory: selectedCategory.value.commodityCategory,
        creator: selectedCategory.value.creator,
        createTime: selectedCategory.value.createTime,
      ));
      Get.back();
      Get.snackbar('Success', 'Category added successfully',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void editCategory(CommodityCategoryModel category) {
    selectedCategory.value = category;
    Get.defaultDialog(
      title: 'Edit Category',
      content: _buildCategoryForm(),
      textConfirm: 'Save',
      onConfirm: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          category.commodityCategory = selectedCategory.value.commodityCategory;
          category.creator = selectedCategory.value.creator;
          category.createTime = selectedCategory.value.createTime;
          categories.refresh();
          Get.back();
          Get.snackbar('Success', 'Category updated successfully',
              snackPosition: SnackPosition.BOTTOM);
        }
      },
      textCancel: 'Cancel',
    );
  }

  void deleteCategory(CommodityCategoryModel category) {
    Get.defaultDialog(
      title: 'Delete Category',
      middleText: 'Are you sure you want to delete ${category.commodityCategory}?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      onConfirm: () {
        categories.remove(category);
        Get.back();
        Get.snackbar('Success', 'Category deleted successfully',
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

  Future<void> exportCategories() async {
    try {
      var excel = Excel.createExcel();
      excel.rename(excel.getDefaultSheet()!, 'Commodity_Category');
      Sheet sheetObject = excel['Commodity_Category'];

      sheetObject.appendRow([
        TextCellValue('No'),
        TextCellValue('Commodity Category'),
        TextCellValue('Creator'),
        TextCellValue('Creation Time'),
      ]);

      for (var category in categories) {
        sheetObject.appendRow([
          TextCellValue(category.no.toString()),
          TextCellValue(category.commodityCategory ?? '-'),
          TextCellValue(category.creator ?? '-'),
          TextCellValue(category.createTime ?? '-'),
        ]);
      }

      var fileBytes = excel.save();
      if (fileBytes == null) {
        print('Error: File bytes are null');
        return;
      }

      var directory = await getApplicationDocumentsDirectory();
      var file = File('${directory.path}/commodity_category_information.xlsx');
      file.createSync(recursive: true);
      file.writeAsBytesSync(fileBytes);

      print('File saved to ${file.path}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Widget _buildCategoryForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: selectedCategory.value.commodityCategory,
            decoration: const InputDecoration(labelText: 'Commodity Category'),
            onSaved: (value) => selectedCategory.value.commodityCategory = value!,
            validator: (value) =>
                value!.isEmpty ? 'Please enter the commodity category' : null,
          ),
          TextFormField(
            initialValue: selectedCategory.value.creator,
            decoration: const InputDecoration(labelText: 'Creator'),
            onSaved: (value) => selectedCategory.value.creator = value!,
          ),
          TextFormField(
            initialValue: selectedCategory.value.createTime,
            decoration: const InputDecoration(labelText: 'Creation Time'),
            onSaved: (value) => selectedCategory.value.createTime = value!,
          ),
        ],
      ),
    );
  }

  void showAddCategoryDialog() {
    selectedCategory.value = CommodityCategoryModel(
      no: 0,
      commodityCategory: '',
      creator: '',
      createTime: '',
    );
    Get.defaultDialog(
      title: 'Add Category',
      content: _buildCategoryForm(),
      textConfirm: 'Add',
      onConfirm: addCategory,
      textCancel: 'Cancel',
    );
  }
}
