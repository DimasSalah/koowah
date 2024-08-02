import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:koowah/app/modules/admin/add_product/data/models/product_model.dart';
import 'package:logger/logger.dart';

import '../../../../data/endpoint.dart';

class HomeProductService extends GetxService {
  final dio = Dio();
  final logger = Logger();

  Future<List<ProductModel>> geAllProduct({
    String? filter,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/rest/v1/product?select=*$filter',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i('Success get all product');
        final data = response.data;
        // logger.i(data);
        return List<ProductModel>.from(
            data.map((x) => ProductModel.fromJson(x)));
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    }
  }
}
