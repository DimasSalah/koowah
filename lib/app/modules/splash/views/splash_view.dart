import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:koowah/app/constant/constant.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: CS.white,
      body: Center(child: Image.asset('assets/images/splash.jpg')),
    );
  }
}
