import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:koowah/app/modules/admin/add_product/views/category_dropdown.dart';

import '../../../../constant/constant.dart';
import '../../../utils/global_component/custom_form2.dart';
import '../../../utils/global_component/main_button.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomForm2(
              hintText: 'Nama Produk',
              onChanged: controller.productNameOnChange,
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                    child: CustomForm2(
                  hintText: 'Harga',
                  keyboardType: TextInputType.phone,
                  onChanged: controller.priceOnChange,
                )),
                Gap(10),
                Expanded(
                    child: CustomForm2(
                  hintText: 'Berat',
                  onChanged: controller.weightOnChange,
                )),
              ],
            ),
            const Gap(10),
            CustomForm2(
              hintText: 'Deskripsi',
              maxLines: 3,
              onChanged: controller.descriptionOnChange,
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                controller.pickFile();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: CS.grey.withOpacity(0.5), width: 1.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.photo_camera_outlined,
                      size: 50,
                      color: CS.grey,
                    ),
                    const Gap(10),
                    Obx(() {
                      return Text(
                        controller.fileName.value,
                        style: TS.regular.copyWith(fontSize: 13),
                      );
                    })
                  ],
                ),
              ),
            ),
            const Gap(10),
            CategoryDropdown(
              selectedPayment: (value) => controller.selectedCategory(value),
            ),
            const Spacer(),
            MainButton(
              onPressed: () {
                controller.submitProduct();
              },
              text: 'Tambah Produk',
            ),
          ],
        ),
      ),
    );
  }
}
