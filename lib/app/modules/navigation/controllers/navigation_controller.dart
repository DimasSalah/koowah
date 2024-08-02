import 'package:get/get.dart';
import 'package:koowah/app/modules/chart/views/chart_view.dart';

import '../../home/views/home_view.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController

  RxInt selectedIndex = 0.obs;

  final screen = [
    const HomeView(),
    const ChartView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

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
}
