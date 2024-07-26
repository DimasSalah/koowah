import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/selector_controller.dart';

class SelectorView extends GetView<SelectorController> {
  const SelectorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SelectorView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Apakah kamu seorang'),
            ElevatedButton(onPressed: () {
              Get.toNamed(Routes.PROFILE);
            }, child: Text('Pembeli')),
            ElevatedButton(onPressed: () {
              Get.toNamed(Routes.REGISTER);
            }, child: Text('Penjual'))
          ],
        ));
  }
}
