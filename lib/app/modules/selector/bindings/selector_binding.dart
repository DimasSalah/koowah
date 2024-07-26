import 'package:get/get.dart';

import '../controllers/selector_controller.dart';

class SelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectorController>(
      () => SelectorController(),
    );
  }
}
