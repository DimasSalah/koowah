import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  final box = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    name.value = box.read('name') ?? '';
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
