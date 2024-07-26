import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:koowah/app/modules/admin/add_product/data/models/product_model.dart';
import 'package:logger/logger.dart';
import 'package:http_parser/src/media_type.dart';

import '../../../../../data/endpoint.dart';
import '../../../../utils/random_string.dart';

class ProductServices extends GetxService {
  final dio = Dio();
  final logger = Logger();

  Future<String> uploadImage({File? image, String? fileName}) async {
    String randomName = generateRandomString(4);
    try {
      String fileName = '';
      MediaType? contentType;

      if (image != null) {
        fileName = image.path.split('/').last;
        String fileExtension = fileName.split('.').last.toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'jpeg') {
          contentType = MediaType('image', 'jpeg');
        } else if (fileExtension == 'png') {
          contentType = MediaType('image', 'png');
        } else {
          throw Exception('File type not supported');
        }
      }

      final FormData formData = FormData.fromMap({
        'File': image != null
            ? await MultipartFile.fromFile(
                image.path,
                filename: fileName,
                contentType: contentType,
              )
            : null,
      });

      final response = await dio.post(
          '$baseUrl/storage/v1/object/product-images/$randomName$fileName',
          data: formData,
          options: Options(
              contentType: Headers.multipartFormDataContentType,
              headers: {
                'apikey': apiKey,
                'Authorization': 'Bearer $apiKey',
              }));
      final key = response.data['Key'];
      final url = '$baseUrl/storage/v1/object/public/$key';
      logger.i(url);
      return url;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> addProduct(
      {required String title,
      required String description,
      required int price,
      required String address,
      required String adminId,
      required String weight,
      required int phone,
      required String imageUrl,
      required String category}) async {
    try {
      final response = await dio.post(
        '$baseUrl/rest/v1/product',
        data: {
          'title': title,
          'description': description,
          'price': price,
          'address': address,
          'admin_id': adminId,
          'quantity': weight,
          'phone': phone,
          'image_url': imageUrl,
          'category': category,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 201 && response.data.isNotEmpty) {
        logger.i(response.data);
        return response;
      }
      logger.e(response.data);
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<ProductModel>> geAllProduct(String adminId) async {
    try {
      final response = await dio.get(
        '$baseUrl/rest/v1/product?admin_id=eq.$adminId',
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
        logger.i(data);
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

  Future<Response> deleteTransaction(int id) async {
    try {
      final response = await dio.delete(
        '$baseUrl/rest/v1/product?id=eq.$id',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 204) {
        logger.i('Success delete transaction');
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> deleteImageStorage(String fileUrl) async {
  try {
    // Extract the file name from the URL
    final key = fileUrl.split('/').last;
    final response = await dio.delete(
      '$baseUrl/storage/v1/object/product-images/$key',
      options: Options(
        headers: {
          'apikey': apiKey,
          'Authorization': 'Bearer $apiKey',
        },
      ),
    );
    if (response.statusCode == 204) {
      logger.i('Success delete image');
    }
  } catch (e) {
    logger.e(e);
    rethrow;
  }
}
}
