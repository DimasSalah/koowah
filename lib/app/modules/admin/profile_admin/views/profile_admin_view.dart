import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../constant/constant.dart';
import '../../../utils/global_component/custom_form.dart';
import '../controllers/profile_admin_controller.dart';
import 'components/city_dropdown.dart';

class ProfileAdminView extends GetView<ProfileAdminController> {
  const ProfileAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: CS.whiteGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  width: Get.width * 0.6,
                  height: Get.width * 0.7,
                  child: Obx(
                    () => SvgPicture.network(
                        'https://api.dicebear.com/9.x/miniavs/svg?seed=${controller.name.value}'),
                  ),
                ),
              ),
              const Gap(10),
              CustomForm(
                  hintText: 'Nama',
                  controller: controller.nameController,
                  onChanged: controller.changeName,
                  icon: 'assets/icons/profile.svg'),
              const Gap(10),
              CustomForm(
                  hintText: 'Nomor Whatsapp',
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  icon: 'assets/icons/phone.svg'),
              const Gap(10),
              CustomForm(
                  hintText: 'Alamat',
                  icon: 'assets/icons/location.svg',
                  controller: controller.addressController),
              const Gap(10),
              Obx(
                () => controller.cities.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : CityDropdown(),
              ),
              const Gap(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CS.blue,
                  minimumSize: Size(Get.width * 1, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  controller.updateProfileInfo();
                },
                child: Text(
                  'Simpan',
                  style: TS.medium.copyWith(fontSize: 14, color: CS.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
