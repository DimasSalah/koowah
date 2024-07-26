import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../selector/auth/data/services/auth_services.dart';

class ProfileAdminController extends GetxController {
  //TODO: Implement ProfileAdminController
  RxString name = ''.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final AuthServices authServices = AuthServices();

  late String id;
  late String adminName;
  late String adminAddress;
  late String adminPhone;

  void changeName(String value) {
    nameController.text = value;
    name.value = nameController.text;
  }

  void changeAddress(String value) {
    adminAddress = value;
  }

  void changePhone(String value) {
    adminPhone = value;
  }

  void updateProfileInfo() {
    print(nameController.text);
    print(addressController.text);
    print(phoneController.text);
    authServices.updateProfile(
        id,
        name.value,
        addressController.text,
        int.parse(phoneController.text),
        'https://api.dicebear.com/9.x/miniavs/svg?seed=${name.value}');
    Get.offAllNamed(Routes.ADMIN);
  }

  final count = 0.obs;
  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    id = arguments['id'];
    adminAddress = arguments['address'];
    adminPhone = arguments['phone'];
    adminName = arguments['name'];
    nameController.text = adminName;
    addressController.text = adminAddress;
    phoneController.text = adminPhone;
    name.value = adminName;
    super.onInit();
  }
}
