import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  RxString userId = ''.obs;

  void checkLogin() async {
    final getId = await GetStorage().read('id');
    final getSesion = await GetStorage().read('session');
    print('getSesion: $getSesion');
    Future.delayed(const Duration(seconds: 3), () {
      if (getSesion == true) {
        Get.offNamed(Routes.NAVIGATION);
      } else if (getId == null || getId == '') {
        Get.offNamed(Routes.ONBOARDING);
      } else if (getId != null) {
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
