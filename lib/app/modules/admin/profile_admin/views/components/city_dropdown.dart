import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koowah/app/constant/constant.dart';

import '../../controllers/profile_admin_controller.dart';

class CityDropdown extends StatelessWidget {
  final ProfileAdminController controller = Get.put(ProfileAdminController());
  final TextEditingController textEditingController = TextEditingController();

  CityDropdown({super.key}) {
    // Add listener to TextEditingController
    textEditingController.addListener(() {
      controller.searchCity(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    //#region
    List<String> cityNames =
        controller.filteredCities.map((city) => city.cityName).toList();
    cityNames = cityNames.toSet().toList();
    List<DropdownMenuItem<String>> dropdownItems =
        cityNames.map((String cityName) {
      return DropdownMenuItem<String>(
        value: cityName,
        child: Text(cityName),
      );
    }).toList();
    //#endregion

    return DropdownButtonHideUnderline(
      child: Obx(() {
        return DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Pilih Kota',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: dropdownItems,
          value: controller.selectedCityName.value.isEmpty
              ? null
              : controller.selectedCityName.value,
          onChanged: (value) {
            if (value != null) {
              // selectedCityName = value; // Simpan city_id yang dipilih
              final selectedCity = controller.filteredCities
                  .firstWhere((city) => city.cityName == value);

              controller.selectedCityName.value =
                  value; // Update selectedCityName
              controller.selectedCityId.value = int.parse(selectedCity.cityId);
              print(controller.selectedCityId.value);
            }
          },
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                  color: CS.grey.withOpacity(0.5),
                  width: 1.5), // Tambahkan border di sini
              borderRadius: BorderRadius.circular(8),
              // Set radius untuk border
            ),
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Cari kota...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          // Clear the search value when closing the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        );
      }),
    );
  }
}
