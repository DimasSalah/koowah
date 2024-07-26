import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString address = ''.obs;

  void changeName(String value) {
    name.value = value;
  }

  void changeAddress(String value) {
    address.value = value;
  }

  void goHome() {
    GetStorage().write('session', 'true');
    GetStorage().write('name', name.value);
    GetStorage().write('address', address.value);
    Get.offAllNamed(Routes.HOME);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
