import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, String>> get({required String url, String? token}) async {
    try {
      final response = await _dio.get(
        url,
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
    required String url,
    required dynamic body,
    required String? token,
  }) async {
    try {
      final response = await _dio.post(
        url,
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
    required String url,
    required dynamic body,
    required String? token,
  }) async {
    try {
      final response = await _dio.put(
        url,
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
    required String url,
    required String? token,
  }) async {
    try {
      final response = await _dio.delete(
        url,
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
