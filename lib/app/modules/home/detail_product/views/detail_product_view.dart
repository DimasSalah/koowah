import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/modules/utils/global_component/main_button.dart';
import 'package:koowah/app/modules/utils/weight_format.dart';

import '../../../../constant/constant.dart';
import '../../../../local/product.dart';
import '../../../utils/currency_format.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Detail Produk', style: TS.regular),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(controller.imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Text(
                        controller.title,
                        style: TS.medium.copyWith(fontSize: 24),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.directMessage(controller.phone);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/whatsapp.svg',
                        width: 30,
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  controller.category,
                  style: TS.medium.copyWith(fontSize: 16, color: CS.blue),
                ),
                const Gap(5),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      color: CS.yellow,
                    ),
                    const Gap(5),
                    Expanded(
                      child: Text(
                        controller.address,
                        style:
                            TS.regular.copyWith(fontSize: 14, color: CS.grey),
                        overflow: TextOverflow
                            .ellipsis, // This will add ellipsis if the text overflows
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/weight.svg',
                      color: CS.yellow,
                      width: 21,
                    ),
                    const Gap(5),
                    Text(
                      formatWeight(int.parse(controller.weight)),
                      style: TS.regular.copyWith(fontSize: 14, color: CS.grey),
                    ),
                  ],
                ),
                const Gap(20),
                Text(
                  'Deskripsi',
                  style: TS.medium.copyWith(fontSize: 18),
                ),
                const Gap(10),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                  ),
                  child: Text(
                    controller.description,
                    overflow: TextOverflow.ellipsis,
                    style: TS.regular.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              const Divider(),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: TS.medium
                                .copyWith(fontSize: 15, color: CS.grey),
                          ),
                          Obx(
                            () => Text(
                              'Rp ${currencyFormatRp(controller.getTotalPrice())}',
                              style: TS.bold.copyWith(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.decrement();
                              },
                              icon: const Icon(Icons.remove)),
                          Obx(
                            () => Text(
                              controller.count.value.toString(),
                              style: TS.medium.copyWith(fontSize: 18),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.increment();
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ],
                  )),
              const Divider(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MainButton(
                onPressed: () {
                  Product newProduct = Product(
                    title: controller.title,
                    price: controller.getTotalPrice().toDouble(),
                    countOrder: controller.count.value,
                    imageUrl: controller.imageUrl,
                    phone: controller.phone,
                    address: controller.address,
                    cityId: controller.cityId,
                    weight: controller.weight,
                  );
                  controller.addProduct(newProduct);
                  Get.snackbar(
                    backgroundColor: Color(0xFF28d045).withOpacity(0.4),
                    'Berhasil',
                    'Barang telah ditambahkan ke keranjang',
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 2),
                  );
                },
                text: 'Tambah ke keranjang'),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
