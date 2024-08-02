import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive/hive.dart';
import 'package:koowah/app/modules/chart/views/chart_view.dart';
import 'package:koowah/app/modules/home/views/home_view.dart';

import '../../../constant/constant.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: CS.blue,
            border: Border.all(color: CS.grey),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            gap: 8,
            backgroundColor: CS.blue,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: CS.yellow,
            padding: const EdgeInsets.all(16),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) => controller.selectedIndex.value = index,
            tabs: [
              GButton(
                icon: Icons.home,
                leading: SvgPicture.asset(
                  'assets/icons/home_fill.svg',
                  color: Colors.white,
                ),
                text: 'Home',
                iconActiveColor: Colors.white,
                textStyle: TextStyle(color: Colors.white),
              ),
              GButton(
                leading: SvgPicture.asset(
                  'assets/icons/bag_fill.svg',
                  color: Colors.white,
                ),
                icon: Icons.shopping_bag,
                text: 'keranjang',
                iconActiveColor: Colors.white,
                textStyle: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomeView();
          case 1:
            return ChartView();
          default:
            return HomeView();
        }
      }),
    );
  }
}
