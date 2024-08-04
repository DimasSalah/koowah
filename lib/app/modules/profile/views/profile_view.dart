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
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 24,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Buat Profil Anda',
                style: TS.regular.copyWith(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(20),
            Container(
              decoration: const BoxDecoration(
                color: CS.whiteGrey,
                shape: BoxShape.circle,
              ),
              width: Get.width * 0.4,
              height: Get.width * 0.4,
              child: Obx(
                () => SvgPicture.network(
                    'https://api.dicebear.com/9.x/adventurer/svg?seed=${controller.name.value}'),
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
            const Gap(15),
            Container(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => controller.cities.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : CityDropdown(),
              ),
            ),
            const Spacer(),
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
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: RichText(
                text: TextSpan(
                  text: 'Masuk sebagai',
                  style: TS.regular.copyWith(fontSize: 14, color: CS.black),
                  children: [
                    TextSpan(
                      text: ' penjual',
                      style: TS.medium.copyWith(fontSize: 14, color: CS.blue),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
