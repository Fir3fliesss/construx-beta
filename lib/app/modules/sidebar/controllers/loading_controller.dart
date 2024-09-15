import 'package:get/get.dart';

class LoadingController extends GetxService {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _startLoading();
  }

  void _startLoading() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void triggerLoading() {
    _startLoading();
  }
}