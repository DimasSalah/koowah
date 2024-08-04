import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../profile/data/model/city_model.dart';
import '../../../selector/auth/data/services/auth_services.dart';

class ProfileAdminController extends GetxController {
  RxString name = ''.obs;
  
  var cities = <CityModel>[].obs;
  var filteredCities = <CityModel>[].obs;
  var selectedCityId = 0.obs;
  var selectedCityName = ''.obs;
  
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


  @override
  void onReady() {
    fetchCities();
    super.onReady();
  }

  Future<void> fetchCities() async {
    final String response =
        await rootBundle.loadString('assets/json/all_city.json');
    final data = json.decode(response);
    cities.value = (data['rajaongkir']['results'] as List)
        .map((city) => CityModel.fromJson(city))
        .toList();
    filteredCities.value = cities; // Initialize with all cities
    Future.delayed(Duration(seconds: 3), () {
      update();
    });
  }

  void searchCity(String query) {
    if (query.isEmpty) {
      filteredCities.value = cities;
    } else {
      filteredCities.value = cities
          .where((city) =>
              city.cityName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
