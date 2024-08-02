import 'package:get/get.dart';

import '../mixins/product_mixin.dart';

class DetailProductController extends GetxController with ProductMixin {
  //TODO: Implement DetailProductController
  late int id;
  late String imageUrl;
  late String title;
  late String description;
  late int price;
  late String category;
  late String weight;
  late String address;
  late int phone;

  final count = 1.obs;
  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    id = arguments['id'];
    imageUrl = arguments['imageUrl'];
    title = arguments['title'];
    description = arguments['description'];
    price = arguments['price'];
    weight = arguments['weight'];
    category = arguments['category'];
    address = arguments['address'];
    phone = arguments['phone'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int getTotalPrice() {
    return price * count.value;
  }

  void increment() => count.value++;
  void decrement() => count.value--;
}
