import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koowah/app/data/endpoint.dart';
import 'package:koowah/app/modules/selector/auth/data/model/admin_model.dart';
import 'package:logger/logger.dart';
import '../../../../../routes/app_pages.dart';

class AuthServices extends GetxService {
  final dio = Dio();
  final logger = Logger();

  Future<Response> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/v1/signup',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
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

  Future<Response> register(String userId, String name, String address,
      int phone, String image) async {
    try {
      final response = await dio.post(
        '$baseUrl/rest/v1/admin',
        data: {
          'id': userId,
          'name': name,
          'address': address,
          'phone': phone,
          'image': image,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 201) {
        logger.i('Berhasil membuat user');
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<AdminModel>  getAdmin(String id) async {
    try {
      final response = await dio.get(
        '$baseUrl/rest/v1/admin?id=eq.$id',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        logger.i(response.data[0]);
        return AdminModel.fromJson(response.data[0]);
      }
      logger.e(response.data);
      return AdminModel(
        id: '',
        name: '',
        address: '',
        phone: 0,
        createdAt: '',
        image: '',
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> loginAuth(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        String id = response.data['user']['id'];
        GetStorage().write('id', id);
        Get.offAllNamed(Routes.ADMIN);
        return response;
      } else {
        logger.e('Login failed');
        return response;
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar('error', 'Email atau password salah',
          colorText: Colors.red,
          backgroundColor: Colors.white.withOpacity(0.5));
      rethrow;
    }
  }

  Future<void> updateProfile(
      String id, String name, String address, int phone, String image) async {
        
    try {
      final response = await dio.patch(
        '$baseUrl/rest/v1/admin?id=eq.$id',
        data: {
          'name': name,
          'address': address,
          'phone': phone,
          'image': image,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 204) {
        logger.i('Berhasil update profile');
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
