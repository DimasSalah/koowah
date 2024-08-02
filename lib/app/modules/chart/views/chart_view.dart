import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../constant/constant.dart';
import '../../utils/currency_format.dart';
import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Keranjang', style: TS.regular),
        centerTitle: true,
      ),
      body: GetBuilder<ChartController>(
        builder: (controller) {
          if (controller.products.isEmpty) {
            return Center(
              child: Text(
                'Keranjang Anda kosong',
                style: TS.medium.copyWith(fontSize: 17),
              ),
            );
          } else {
            return Obx(
              () => ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text('Beli Sekarang',
                                  style: TS.medium.copyWith(fontSize: 20)),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(product.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    product.title,
                                    style: TS.medium.copyWith(fontSize: 16),
                                  ),
                                  const Gap(5),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/location.svg',
                                        color: CS.yellow,
                                      ),
                                      const Gap(8),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: Get.width * 0.5,
                                        ),
                                        child: Text(
                                          product.address,
                                          maxLines: 2,
                                          style: TS.regular.copyWith(
                                            fontSize: 12,
                                            color: CS.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Text(
                                    'Total Harga :',
                                    style: TS.regular.copyWith(
                                      fontSize: 13,
                                      color: CS.black,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    'Rp ${currencyFormatRpDouble(product.price)}',
                                    style: TS.semiBold.copyWith(
                                      fontSize: 16,
                                      color: CS.black,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                GestureDetector(
                                  onTap: () {
                                    controller.launchWhatsAppUri(
                                      product.phone.toString(),
                                      product.title,
                                      product.address,
                                      currencyFormatRpDouble(product.price),
                                      product.countOrder.toString(),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF28d045),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/whatsapp.svg',
                                          color: CS.white,
                                        ),
                                        const Gap(5),
                                        Text(
                                          'Hubungi Penjual',
                                          style: TS.regular.copyWith(
                                            fontSize: 14,
                                            color: CS.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        leading: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(product.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(product.title,
                            style: TS.medium.copyWith(fontSize: 14)),
                        subtitle: Text(
                          'Rp ${currencyFormatRpDouble(product.price)} (${product.countOrder} item)',
                          style: TS.regular.copyWith(fontSize: 13),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            controller.removeProduct(product);
                          },
                        ),
                      ),
                      const Gap(10),
                      const Divider(
                        color: CS.whiteGrey,
                        height: 1,
                        thickness: 6,
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
