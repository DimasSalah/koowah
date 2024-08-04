import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import '../data/services/shipping_services.dart';

class CheckoutController extends GetxController {
  List<String> shippingOptions = ['JNE', 'TIKI', 'POS'];
  RxString selectedShippingOption = 'JNE'.obs;
  RxList shippingCost = [].obs;

  var selectedShippingCost = 0.obs;

  // Method untuk mengubah harga pengiriman yang dipilih
  void changeSelectedShippingCost(int cost) {
    selectedShippingCost.value = cost;
  }

  late int originCity;
  late String originCityName;
  late String title;
  late double price;
  late int countOrder;
  late String imageUrl;
  late int phone;
  late String address;
  late int cityId;
  late String weightProduct;

  void changeShippingOption(String value) {
    selectedShippingOption.value = value;
    update(['courier']);
  }

  @override
  void onInit() {
    originCity = GetStorage().read('cityId');
    originCityName = GetStorage().read('address');
    final arguments = Get.arguments as Map<String, dynamic>;
    title = arguments['title'];
    price = arguments['price'];
    countOrder = arguments['countOrder'];
    imageUrl = arguments['imageUrl'];
    phone = arguments['phone'];
    address = arguments['address'];
    cityId = arguments['cityId'];
    weightProduct = arguments['weight'];
    super.onInit();
  }

  Future getShippingCost() async {
    try {
      final response = await ShippingServices().getShippingCourier(
        originCity,
        cityId,
        weightProduct,
        selectedShippingOption.value.toLowerCase(),
      );
      shippingCost.value = response.rajaongkir.results[0].costs;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    return shippingCost.first;
  }

  void launchWhatsAppUri(
      String phone,
      String title,
      String address,
      String price,
      String order,
      String shippingPrice,
      String totalPrice) async {
    final message = 'Halo, saya ingin membeli produk $title\n'
        'Alamat pengiriman saya adalah:\n'
        '$address\n\n'
        'menggunakan jasa pengiriman *$selectedShippingOption*\n\n'
        'Detail Harga:\n\n'
        'Harga Produk Rp $price\n\n'
        'Pengiriman  $shippingPrice\n\n'
        'Total Pembayaran Rp $totalPrice\n\n'
        'Terima kasih!';

    final link = WhatsAppUnilink(
      phoneNumber: phone,
      text: message,
    );
    await launchUrlString(link.toString());
  }
}
