import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koowah/app/modules/selector/views/components/tab_item.dart';
import 'package:koowah/app/modules/utils/global_component/main_button.dart';
import '../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/selector_controller.dart';


class SelectorView extends GetView<SelectorController> {
  const SelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Pilih Peran',
            style: TS.medium.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              child: Obx(
                () => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                  decoration: BoxDecoration(
                    color: CS.whiteGrey,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 7),
                    unselectedLabelColor: CS.whiteGrey,
                    labelColor: CS.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          color: controller.selectedIndex.value == 0
                              ? CS.yellow.withOpacity(0.5)
                              : CS.yellow.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                      color: controller.selectedIndex.value == 0
                          ? CS.yellow
                          : CS.yellow,
                      borderRadius: controller.selectedIndex.value == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                    ),
                    tabs: [
                      TabItem(
                        title: 'Pembeli',
                        textStyle:
                            TS.medium.copyWith(fontSize: 16, color: CS.blue),
                      ),
                      TabItem(
                        title: 'Penjual',
                        textStyle:
                            TS.medium.copyWith(fontSize: 16, color: CS.blue),
                      ),
                    ],
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SignInTab(),
            SignUpTab(),
          ],
        ),
      ),
    );
  }
}

class SignInTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image.asset('assets/magnifying_glass.png'), // Ganti dengan path gambar Anda
          Container(
            width: Get.width * 0.5,
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/images/buyer.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(20),
          MainButton(
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              text: 'Pembeli'),
        ],
      ),
    );
  }
}

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image.asset('assets/magnifying_glass.png'), // Ganti dengan path gambar Anda
          Container(
            width: Get.width * 0.5,
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/images/seller.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(20),
          MainButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER);
              },
              text: 'Penjual'),
        ],
      ),
    );
  }
}
