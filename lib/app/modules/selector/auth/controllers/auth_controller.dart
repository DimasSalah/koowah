import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koowah/app/modules/selector/auth/data/services/auth_services.dart';

import '../../../../routes/app_pages.dart';
import '../../../profile/data/model/city_model.dart';

class AuthController extends GetxController {
  final AuthServices authServices = AuthServices();
  final formKey = GlobalKey<FormState>();

  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString address = ''.obs;
  RxString phone = '0'.obs;
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  RxBool isValidate = false.obs;

  var cities = <CityModel>[].obs;
  var filteredCities = <CityModel>[].obs;
  var selectedCityId = 0.obs;
  var selectedCityName = ''.obs;

  void changeName(String value) {
    name.value = value;
  }

  void changeEmail(String value) {
    email.value = value;
    update(['email']);
  }

  void changePassword(String value) {
    password.value = value;
    update();
  }

  void changeAddress(String value) {
    address.value = value;
  }

  void changePhone(String value) {
    phone.value = value;
  }

  void goLogin() {
    Get.offNamed(Routes.LOGIN);
    formKey.currentState!.reset();
  }

  validateEmail(String? email) {
    if (email != null && !GetUtils.isEmail(email)) {
      return 'Email tidak valid';
    }
    return null;
  }

  validatePassword(String? pwd) {
    if (pwd!.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Nomor ponsel tidak boleh kosong';
    }
    if (phone.startsWith('0')) {
      return 'kamu harus mengganti 0 dengan 62';
    }
    if (!phone.startsWith('62')) {
      return 'Nomor ponsel tidak valid, harus dimulai dengan 62';
    }
    return null;
  }

  Future<void> createAdmin() async {
    isValidate.value = true;
    if (formKey.currentState!.validate() && selectedCityId.value != 0) {
      isLoading.value = true;
      try {
        final response = await authServices.signIn(email.value, password.value);
        final id = response.data['user']['id'];
        GetStorage().write('id', id);
        await authServices.register(
            id,
            name.value,
            address.value,
            int.parse(phone.value),
            'https://api.dicebear.com/9.x/miniavs/svg?seed=$name',
            selectedCityId.value);
        isLoading.value = false;
        Get.offAllNamed(Routes.LOGIN);
      } catch (e) {
        Get.snackbar('Error', e.toString());
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Error', 'Form tidak valid');
    }
  }

  Future<void> login() async {
    await authServices.loginAuth(email.value, password.value);
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
    filteredCities.value = cities;
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
