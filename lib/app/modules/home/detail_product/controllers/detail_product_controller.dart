import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
  late int cityId;

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
    cityId = arguments['cityId'];
    super.onInit();
  }

  Future<void> directMessage(int phone) async {
    final Uri _url = Uri.parse(
        'https://wa.me/$phone/?text=Halo%20saya%20ingin%20bertanya%20tentang%20produk%20ini');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
