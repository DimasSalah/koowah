import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koowah/app/modules/admin/add_product/data/services/product_services.dart';
import 'package:koowah/app/modules/selector/auth/data/services/auth_services.dart';
import '../../../routes/app_pages.dart';
import '../add_product/data/models/product_model.dart';

class AdminController extends GetxController {
  final AuthServices authServices = AuthServices();
  final ProductServices productServices = ProductServices();
  final id = GetStorage().read('id');

  RxString adminId = ''.obs;
  RxString adminName = ''.obs;
  RxString adminAddress = ''.obs;
  RxInt adminPhone = 0.obs;
  RxInt adminCity = 0.obs;
  RxString image = 'https://api.multiavatar.com/996897.59941f9f699b.svg'.obs;
  RxList<ProductModel> productsList = <ProductModel>[].obs;

  void goToAddProduct() {
    Get.toNamed(Routes.ADD_PRODUCT);
  }

  Future<void> fetchAdmin(String id) async {
    await authServices.getAdmin(id).then((value) {
      adminName.value = value.name;
      adminAddress.value = value.address;
      adminPhone.value = value.phone;
      image.value = value.image;
      adminCity.value = value.cityId;
      print(adminCity);
    });
  }

  void fetchAllProduct() async {
    final response = await productServices.geAllProduct(id);
    productsList.value = response;
  }

  void deleteProduct(int id) async {
    await productServices.deleteTransaction(id);
    fetchAllProduct();
  }

  @override
  void onReady() {
    fetchAdmin(id);
    fetchAllProduct();
    adminId.value = id;
    super.onReady();
  }
}
