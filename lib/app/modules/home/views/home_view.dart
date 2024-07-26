import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/constant/constant.dart';

import '../controllers/home_controller.dart';
import 'components/header_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => HeaderBar(
                  name: controller.name.value, 
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: CS.whiteGrey,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: CS.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '🔥',
                        style: TS.semiBold.copyWith(fontSize: 30),
                      ),
                    ),
                    const Gap(14),
                    Text('Semua ', style: TS.medium.copyWith(fontSize: 12)),
                    const Gap(14)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.4,
                ),
                decoration: BoxDecoration(
                  color: CS.whiteGrey.withOpacity(0.02),
                  border: Border.all(color: CS.whiteGrey, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/idea.png',
                      width: 150,
                    ),
                    Text('Judul', style: TS.medium.copyWith(fontSize: 15)),
                    const Gap(4),
                    Text('Deskripsi', style: TS.regular.copyWith(fontSize: 13)),
                    const Gap(10),
                    Row(
                      children: [
                        Text('Rp 10rb',
                            style: TS.semiBold.copyWith(fontSize: 15)),
                        Spacer(),
                        Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: CS.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Bag.svg',
                              width: 20,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
