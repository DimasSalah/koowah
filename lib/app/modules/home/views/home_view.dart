import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koowah/app/constant/constant.dart';
import 'package:koowah/app/modules/utils/currency_format.dart';
import 'package:koowah/app/modules/utils/weight_format.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'components/card_product.dart';
import 'components/header_bar.dart';
import 'components/search_header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => HeaderBar(
                    name: controller.name.value,
                    onLogout: () {
                      GetStorage().erase();
                      controller.clearCart();
                      Get.offAllNamed(Routes.PROFILE);
                    },
                  ),
                ),
                const Gap(20),
                SearchHeader(
                    onChanged: (value) => controller.filterProduct(value)),
                const Gap(10),
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: GetBuilder<HomeController>(builder: (controller) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          icon: controller.categories[index]['emoji']!,
                          title: controller.categories[index]['title']!,
                          color: controller.activeCategoryIndex.value == index
                              ? CS.yellow
                              : CS.whiteGrey,
                          onTap: () {
                            controller.changeCategory(index);
                            controller.getAllProduct(
                                filter: controller.categories[index]
                                    ['function']);
                          },
                        );
                      },
                    );
                  }),
                ),
                const Gap(20),
                Obx(() {
                  if (controller.filteredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        'Produk tidak ditemukan',
                        style: TS.regular.copyWith(fontSize: 17),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: controller.filteredProducts.length,
                      itemBuilder: (context, index) {
                        return cardProduct(
                          onTap: () =>
                              Get.toNamed(Routes.DETAIL_PRODUCT, arguments: {
                            'id': controller.filteredProducts[index].id,
                            'description':
                                controller.filteredProducts[index].description,
                            'imageUrl':
                                controller.filteredProducts[index].imageUrl,
                            'title': controller.filteredProducts[index].title,
                            'category':
                                controller.filteredProducts[index].category,
                            'address':
                                controller.filteredProducts[index].address,
                            'weight':
                                controller.filteredProducts[index].quantity,
                            'price': controller.filteredProducts[index].price,
                            'phone': controller.filteredProducts[index].phone,
                            'cityId': controller.filteredProducts[index].cityId,
                          }),
                          title: controller.filteredProducts[index].title,
                          url: controller.filteredProducts[index].imageUrl,
                          weight: formatWeight(int.parse(
                              controller.filteredProducts[index].quantity)),
                          price: currencyFormatRp(
                              controller.filteredProducts[index].price.toInt()),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final Function()? onTap;
  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 80,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: CS.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TS.semiBold.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Gap(14),
            Text(title, style: TS.medium.copyWith(fontSize: 12)),
            const Gap(14),
          ],
        ),
      ),
    );
  }
}
