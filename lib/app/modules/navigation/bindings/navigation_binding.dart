import 'package:get/get.dart';
import 'package:koowah/app/modules/chart/controllers/chart_controller.dart';
import 'package:koowah/app/modules/home/controllers/home_controller.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ChartController>(
      () => ChartController(),
    );
  }
}
