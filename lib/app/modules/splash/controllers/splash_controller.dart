import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  RxString userId = ''.obs;
  void checkLogin() async {
    final getId = await GetStorage().read('id');
    Future.delayed(const Duration(seconds: 3), () {
      if (getId == null || getId == '') {
        Get.offNamed(Routes.ONBOARDING);
      } else {
        userId.value = getId;
        Get.offNamed(Routes.ADMIN);
      }
    });
  }

  @override
  void onReady() {
    print('SplashController Ready');
    checkLogin();
    super.onReady();
  }
}
