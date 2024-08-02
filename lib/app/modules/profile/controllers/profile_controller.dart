import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../data/model/city_model.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString address = ''.obs;
  var cities = <CityModel>[].obs;
  var filteredCities = <CityModel>[].obs;
  var selectedCityId = 0.obs;
  var selectedCityName = ''.obs;

  void changeName(String value) {
    name.value = value;
  }

  void changeAddress(String value) {
    address.value = value;
  }

  void goHome() {
    GetStorage().write('session', true);
    GetStorage().write('name', name.value);
    GetStorage().write('address', address.value);
    GetStorage().write('cityId', selectedCityId.value);
    print(selectedCityId.value);
    Get.offAllNamed(Routes.NAVIGATION);
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
