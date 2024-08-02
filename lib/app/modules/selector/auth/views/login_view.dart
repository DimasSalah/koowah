import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/modules/utils/global_component/custom_form.dart';

import '../../../../constant/constant.dart';
import '../../../utils/global_component/main_button.dart';
import '../../controllers/selector_controller.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text('Ayo Masuk',
                  style: TS.medium.copyWith(fontSize: 26, color: CS.black)),
              Text(
                'ayo masuk dan mulai berjualan',
                style: TS.regular.copyWith(color: CS.grey),
              ),
              Gap(20),
              CustomForm(
                  hintText: 'Email',
                  validator: (email) => controller.validateEmail(email),
                  onChanged: controller.changeEmail,
                  icon: 'assets/icons/Message.svg'),
              const Gap(10),
              Obx(
                () => CustomForm(
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
              ),
              const Gap(10),
              MainButton(
                onPressed: () {
                  controller.login();
                },
                text: 'Masuk',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
