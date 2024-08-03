import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koowah/app/routes/app_pages.dart';
import '../../../constant/constant.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(50),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                height: Get.height * 0.7,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
              items: controller.slide.map((slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          width: Get.width * 0.6,
                          slide['image']!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              controller.slide.length,
                              (index) => Obx(
                                    () => Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 30,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: controller.currentIndex.value ==
                                                index
                                            ? CS.blue
                                            : CS.whiteGrey,
                                      ),
                                    ),
                                  )),
                        ),
                        Gap(20),
                        Column(
                          children: [
                            Text(
                              slide['text']!,
                              style: TS.bold.copyWith(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            Gap(7),
                            Text(
                              slide['subtext']!,
                              textAlign: TextAlign.center,
                              style: TS.regular.copyWith(
                                fontSize: 16,
                                color: CS.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              }).toList(),
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
                Get.toNamed(Routes.PROFILE);
                // Get.toNamed(Routes.SELECTOR);
              },
              child: Text(
                'Ayo Mulai',
                style: TS.medium.copyWith(fontSize: 14, color: CS.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
