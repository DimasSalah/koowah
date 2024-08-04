import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:koowah/app/data/endpoint.dart';
import 'package:logger/logger.dart';

import '../model/shipping_model.dart';

class ShippingServices extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final baseUrl = EnvConstants.baseUrl;
  final apiKey = EnvConstants.apiKey;
  final apiRJO = EnvConstants.apiRJO;

  Future<ShippingModel> getShippingCourier(
      int origin,
      int destination,
      String weight,
      String courier,
      ) async {
    try {
      final response = await dio.post(
        'https://api.rajaongkir.com/starter/cost',
        options: Options(
          headers: {
            'key': apiRJO,
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'origin': origin,
          'destination': destination,
          'weight': weight,
          'courier': courier,
        },
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        logger.i(response.data);
        return ShippingModel.fromJson(response.data);
      }
      logger.e(response.data);
      throw Exception('Failed to get shipping cost');
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
