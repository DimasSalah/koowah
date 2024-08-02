import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koowah/app/modules/admin/add_product/data/services/product_services.dart';

import '../../../constant/constant.dart';
import '../../../routes/app_pages.dart';
import '../../utils/currency_format.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin', style: TS.medium),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Apakah anda yakin ingin keluar?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          GetStorage().erase();
                          Get.offAllNamed(Routes.SELECTOR);
                        },
                        child: const Text('Ya'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Tidak'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout_sharp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/wave.svg',
                            fit: BoxFit.contain,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    color: CS.lavender,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Obx(() => ClipOval(
                                        child: SvgPicture.network(
                                            controller.image.value),
                                      )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.PROFILE_ADMIN,
                                          arguments: {
                                            'id': controller.adminId.value,
                                            'name': controller.adminName.value,
                                            'address':
                                                controller.adminAddress.value,
                                            'phone': controller.adminPhone
                                                .toString(),
                                          });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: CS.whiteGrey,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: CS.grey, width: 1.5),
                                      ),
                                      child: Icon(Icons.edit,
                                          color: CS.grey, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Obx(
                        () => Column(
                          children: [
                            Text(
                              'Halo ${controller.adminName.value} !',
                              style: TS.medium.copyWith(fontSize: 22),
                            ),
                            Text(
                              controller.adminAddress.value,
                              style: TS.regular.copyWith(fontSize: 15),
                            ),
                            Text(
                              controller.adminPhone.toString(),
                              style: TS.regular.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CS.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: CS.lavender.withOpacity(0.5), width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Produk anda',
                          style: TS.medium
                              .copyWith(fontSize: 15, color: CS.white)),
                      Obx(
                        () => Text(controller.productsList.length.toString(),
                            style: TS.medium
                                .copyWith(fontSize: 15, color: CS.white)),
                      )
                    ],
                  ),
                ),
                const Gap(10),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.productsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: CS.grey.withOpacity(0.5), width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(controller
                                        .productsList[index].imageUrl),
                                  ),
                                )),
                            const Gap(10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.productsList[index].title,
                                  style: TS.medium.copyWith(
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Rp ${currencyFormatRp(controller.productsList[index].price)}',
                                  style: TS.regular.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.productsList[index].quantity,
                                  style: TS.regular.copyWith(fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    controller.deleteProduct(
                                        controller.productsList[index].id);
                                    ProductServices().deleteImageStorage(
                                        controller
                                            .productsList[index].imageUrl);
                                    controller.productsList.removeAt(index);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 30,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 25, right: 15),
          child: FloatingActionButton(
            backgroundColor: CS.blue,
            elevation: 0,
            onPressed: () {
              Get.toNamed(Routes.ADD_PRODUCT, arguments: {
                'id': controller.adminId.value.toString(),
                'adminAddress': controller.adminAddress,
                'adminPhone': controller.adminPhone.toString(),
              });
            },
            child: const Icon(
              Icons.add_circle,
              color: CS.white,
              size: 40,
            ),
          ),
        ));
  }
}
