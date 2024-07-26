import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/modules/utils/global_component/custom_form.dart';

import '../../../../constant/constant.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';
import '../../controllers/selector_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Form(
                key: controller.formKey,
                autovalidateMode: controller.isValidate.value
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const Gap(20),
                    Text('Daftar Sebagai Penjual',
                        style:
                            TS.medium.copyWith(fontSize: 26, color: CS.black)),
                    Text('ayo mendaftar dan jual produkmu sekarang',
                        style:
                            TS.regular.copyWith(fontSize: 14, color: CS.grey)),
                    const Gap(20),
                    CustomForm(
                        hintText: 'Email',
                        validator: (email) => controller.validateEmail(email),
                        onChanged: controller.changeEmail,
                        icon: 'assets/icons/Message.svg'),
                    const Gap(10),
                    CustomForm(
                        hintText: 'Nama',
                        onChanged: controller.changeName,
                        icon: 'assets/icons/profile.svg'),
                    const Gap(10),
                    CustomForm(
                        hintText: 'Nomor Whatsapp',
                        onChanged: controller.changePhone,
                        icon: 'assets/icons/phone.svg'),
                    const Gap(10),
                    CustomForm(
                        hintText: 'Alamat',
                        onChanged: controller.changeAddress,
                        icon: 'assets/icons/location.svg'),
                    const Gap(10),
                    CustomForm(
                      hintText: 'Password',
                      validator: (pwd) => controller.validatePassword(pwd),
                      onChanged: controller.changePassword,
                      icon: 'assets/icons/Lock.svg',
                      obscureText: controller.obsecureText.value,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.obsecureText.value =
                              !controller.obsecureText.value;
                        },
                        child: Container(
                          width: 10,
                          height: 20,
                          child: SvgPicture.asset(
                            controller.obsecureText.value
                                ? 'assets/icons/eye-closed.svg'
                                : 'assets/icons/eye-open.svg',
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CS.blue,
                        minimumSize: Size(Get.width * 1, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        await controller.createAdmin();
                      },
                      child: Text(
                        'Simpan',
                        style:
                            TS.medium.copyWith(fontSize: 14, color: CS.white),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () => controller.goLogin(),
                      child: RichText(
                        text: TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TS.regular
                              .copyWith(fontSize: 14, color: CS.black),
                          children: [
                            TextSpan(
                              text: 'Masuk',
                              style: TS.medium
                                  .copyWith(fontSize: 14, color: CS.blue),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
