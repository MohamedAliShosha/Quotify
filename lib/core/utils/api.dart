import 'package:dio/dio.dart';
import 'package:starter_template/core/utils/constants.dart';

class ApiServices {
  final Dio _dio;
  final _baseUrl = Constants.baseUrl;
  ApiServices(this._dio);

  Future<dynamic> get({required String endPoint, String? token}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$endPoint',
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('GET Error: ${e.response?.statusCode} - ${e.message}');
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required dynamic body,
    required String? token,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('POST Error: ${e.response?.statusCode} - ${e.message}');
    }
  }

  Future<dynamic> put({
    required String endPoint,
    required dynamic body,
    required String? token,
  }) async {
    try {
      final response = await _dio.put(
        '$_baseUrl$endPoint',
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('PUT Error: ${e.response?.statusCode} - ${e.message}');
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    required String? token,
  }) async {
    try {
      final response = await _dio.delete(
        '$_baseUrl$endPoint',
        options: Options(
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('DELETE Error: ${e.response?.statusCode} - ${e.message}');
    }
  }
}
