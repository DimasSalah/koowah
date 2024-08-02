import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SelectorController extends GetxController {
  @override
  void onInit() {
    print('SelectorController onInit');
    super.onInit();
  }

  RxInt selectedIndex = 0.obs;
  RxBool selectedTab = true.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
