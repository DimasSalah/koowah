import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:koowah/app/modules/admin/add_product/data/services/product_services.dart';
import 'package:koowah/app/routes/app_pages.dart';

import '../../../utils/random_string.dart';

class AddProductController extends GetxController {
  RxString productName = ''.obs;
  RxInt price = 0.obs;
  RxString weight = ''.obs;
  RxString description = ''.obs;
  Rx<File?> filepath = Rx<File?>(null);
  RxString fileName = 'Pilih Gambar'.obs;
  RxString category = 'Kopi Arabika'.obs;
  RxString imageUrl = ''.obs;

  late String id;
  late RxString adminAddress;
  late String adminPhone;
  final ProductServices productServices = ProductServices();

  RxInt adminId = 0.obs;
  RxString address = ''.obs;
  RxInt phone = 0.obs;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      filepath.value = File(result.files.single.path!);
      fileName.value = result.files.single.name;
    }
  }

  void productNameOnChange(String value) {
    productName.value = value;
  }

  void priceOnChange(String value) {
    price.value = int.parse(value);
  }

  void weightOnChange(String value) {
    weight.value = value;
  }

  void descriptionOnChange(String value) {
    description.value = value;
  }

  void selectedCategory(String value) {
    category.value = value;
  }

  void submitProduct() async {
    // print(weight.value);
    await imageUpload();
    await addProduct();
  }

  Future<void> imageUpload() async {
    final url = await productServices.uploadImage(
      image: filepath.value,
      fileName: fileName.value,
    );
    imageUrl.value = url;
  }

  Future<void> addProduct() async {
    await productServices.addProduct(
      title: productName.value,
      price: price.value,
      weight: weight.value,
      description: description.value,
      imageUrl: imageUrl.value,
      category: category.value,
      adminId: id,
      address: adminAddress.value,
      phone: int.parse(adminPhone),
    );
    Get.offAllNamed(Routes.ADMIN);
  }

  @override
  void onInit() {
    final arguments = Get.arguments as Map<String, dynamic>;
    id = arguments['id'];
    adminAddress = arguments['adminAddress'];
    adminPhone = arguments['adminPhone'];
    super.onInit();
  }
}
