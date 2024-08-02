import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/modules/profile/views/components/city_dropdown.dart';

import '../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../../utils/global_component/custom_form.dart';
import '../controllers/profile_controller.dart';
import '../data/model/city_model.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Lengkapi Profil',
          style: TS.medium.copyWith(fontSize: 20, color: CS.black),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                      'https://api.dicebear.com/9.x/adventurer/svg?seed=${controller.name.value}'),
                ),
              ),
            ),
            const Gap(20),
            CustomForm(
                hintText: 'Nama',
                onChanged: controller.changeName,
                icon: 'assets/icons/profile.svg'),
            const Gap(20),
            CustomForm(
                hintText: 'Alamat',
                onChanged: controller.changeAddress,
                icon: 'assets/icons/location.svg'),
            const Gap(20),
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
                controller.goHome();
              },
              child: Text(
                'Simpan',
                style: TS.medium.copyWith(fontSize: 14, color: CS.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
