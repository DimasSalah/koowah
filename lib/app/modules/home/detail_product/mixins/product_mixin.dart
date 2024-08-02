import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../local/product.dart';
import '../../../../routes/app_pages.dart';

mixin ProductMixin on GetxController {
  var products = <Product>[].obs;
  late Box<Product> cartBox;

  @override
  void onInit() {
    super.onInit();
    cartBox = Hive.box<Product>('cart');
    products.addAll(cartBox.values);
  }

  void addProduct(Product product) {
    cartBox.add(product);
    products.add(product);
    update();
    Get.offAllNamed(Routes.NAVIGATION);
    print(products.length);
    print(product.key);
    print(product.title);
    print(product.price);
    print(product.countOrder);
    print(product.imageUrl);
    print(product.phone);
    print(product.address);

    print('Product added');
  }

  // void removeProduct(Product product) {
  //   cartBox.delete(product.key);
  //   products.remove(product);
  // }
}
