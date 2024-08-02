import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:koowah/app/modules/home/data/services/Home_product_service.dart';

import '../../../local/product.dart';
import '../../admin/add_product/data/models/product_model.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  final HomeProductService homeProductService = HomeProductService();

  late Box<Product> cartBox;

  RxString name = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    name.value = box.read('name') ?? '';
    getAllProduct();
    filteredProducts.value = productsList;
    cartBox = Hive.box<Product>('cart');
    super.onInit();
  }

  void clearCart() {
    cartBox.clear(); // Menghapus semua data di box
  }

  final List<Map<String, String>> categories = [
    {'title': 'Semua', 'emoji': '🔥', 'function': ''},
    {
      'title': 'Arabica',
      'emoji': '☕',
      'function': '&category=eq.Kopi%20Arabika'
    },
    {
      'title': 'Robusta',
      'emoji': '☕',
      'function': '&category=eq.Kopi%20Robusta'
    },
    {'title': 'Buah', 'emoji': '🍒', 'function': '&category=eq.Buah%20Buahan'},
  ];

  var activeCategoryIndex = 0.obs;

  // Fungsi untuk mengubah indeks kategori aktif
  void changeCategory(int index) {
    activeCategoryIndex.value = index;
    update(); // Memperbarui UI
  }

  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  RxList<ProductModel> productsList = <ProductModel>[].obs;

  Future<void> getAllProduct({String? filter}) async {
    final response = await homeProductService.geAllProduct(filter: filter);
    productsList.assignAll(response);
    filteredProducts.assignAll(response);
  }

  void filterProduct(String nameProduct) {
    if (filteredProducts.isEmpty) {
      filteredProducts.value = productsList;
    } else {
      filteredProducts.value = productsList
          .where((element) =>
              element.title.toLowerCase().contains(nameProduct.toLowerCase()))
          .toList();
    }
  }
}
