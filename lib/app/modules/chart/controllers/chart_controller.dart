import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../local/product.dart';

class ChartController extends GetxController {
  var products = <Product>[].obs;
  late Box<Product> cartBox;

  @override
  void onInit() {
    super.onInit();
    cartBox = Hive.box<Product>('cart');
    print('CartBox length: ${cartBox.length}');
    products.addAll(cartBox.values);
  }

  void addProduct(Product product) {
    cartBox.add(product);
    products.add(product);
  }

  void removeProduct(Product product) {
    cartBox.delete(product.key);
    products.remove(product);
  }

  // void printCartBoxValues() {
  //   for (var product in cartBox.values) {
  //     print(product);
  //   }
  // }


}
