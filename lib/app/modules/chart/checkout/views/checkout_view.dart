import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:koowah/app/modules/chart/checkout/data/model/shipping_model.dart';
import 'package:koowah/app/modules/utils/currency_format.dart';
import 'package:koowah/app/modules/utils/global_component/main_button.dart';
import 'package:koowah/app/modules/utils/weight_format.dart';
import '../../../../constant/constant.dart';
import '../controllers/checkout_controller.dart';
import 'components/address_section.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran & Konfirmasi',
            style: TS.regular.copyWith(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressSection(
                address: controller.originCityName,
              ),
              const Divider(
                thickness: 7,
                color: CS.whiteGrey,
              ),
              ListTile(
                leading: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(controller.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  controller.title,
                  style: TS.regular.copyWith(fontSize: 16, color: CS.grey),
                ),
                subtitle: Text(
                    '${controller.countOrder} x Rp ${currencyFormatRpDouble(controller.price / controller.countOrder)}',
                    style: TS.semiBold.copyWith(fontSize: 14)),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          controller.address,
                          style:
                              TS.regular.copyWith(fontSize: 13, color: CS.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'Berat : ${formatWeight(
                          int.parse(controller.weightProduct) *
                              controller.countOrder,
                        )}',
                        style:
                            TS.regular.copyWith(fontSize: 13, color: CS.grey),
                      ),
                    ],
                  )),
              const Divider(
                thickness: 7,
                color: CS.whiteGrey,
              ),
              Obx(
                () => DropdownButton<String>(
                  value: controller.selectedShippingOption.value,
                  items: controller.shippingOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.changeShippingOption(newValue);
                    }
                  },
                  isExpanded: true,
                  style: TS.regular.copyWith(fontSize: 16),
                  borderRadius: BorderRadius.circular(20),
                  elevation: 2,
                  focusColor: CS.whiteGrey,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              GetBuilder<CheckoutController>(
                id: 'courier',
                builder: (context) {
                  return FutureBuilder(
                    future: controller.getShippingCost(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: const CupertinoActivityIndicator());
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.shippingCost.length,
                          itemBuilder: (BuildContext context, int index) {
                            final courir = controller.shippingCost[index];
                            return ListTile(
                              onTap: () {
                                controller.changeSelectedShippingCost(
                                    courir.cost[0].value);
                              },
                              title: Text(courir.service,
                                  style: TS.regular.copyWith(fontSize: 14)),
                              subtitle: Text(courir.description,
                                  style: TS.regular.copyWith(fontSize: 12)),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rp ${currencyFormatRp(courir.cost[0].value)}',
                                    style: TS.semiBold
                                        .copyWith(fontSize: 14, color: CS.blue),
                                  ),
                                  Text(
                                    '${courir.cost[0].etd} Hari',
                                    style: TS.regular.copyWith(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
              const Divider(
                thickness: 7,
                color: CS.whiteGrey,
              ),
              //detail harga
              Obx(() {
                final productPrice = controller.price;
                final shippingCost = controller.selectedShippingCost.value;
                final totalPrice = productPrice + shippingCost;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Harga',
                        style: TS.semiBold.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Harga Produk',
                              style: TS.regular.copyWith(fontSize: 14)),
                          Text('Rp ${currencyFormatRpDouble(productPrice)}',
                              style: TS.regular.copyWith(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Harga Pengiriman',
                              style: TS.regular.copyWith(fontSize: 14)),
                          Text('Rp ${currencyFormatRp(shippingCost)}',
                              style: TS.regular.copyWith(fontSize: 14)),
                        ],
                      ),
                      const Divider(thickness: 1, color: CS.whiteGrey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Harga',
                              style: TS.semiBold.copyWith(fontSize: 16)),
                          Text('Rp ${currencyFormatRpDouble(totalPrice)}',
                              style: TS.semiBold.copyWith(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              const Divider(
                thickness: 7,
                color: CS.whiteGrey,
              ),
              const Gap(10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: MainButton(
                    onPressed: () {
                      controller.launchWhatsAppUri(
                        controller.phone.toString(),
                        controller.title,
                        controller.address,
                        currencyFormatRpDouble(controller.price),
                        controller.countOrder.toString(),
                        currencyFormatRp(controller.selectedShippingCost.value),
                        currencyFormatRpDouble(controller.price +
                            controller.selectedShippingCost.value),
                      );
                    },
                    text: "Beli Sekarang"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
