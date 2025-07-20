import 'package:dio/dio.dart';

import 'package:starter_template/core/utils/constants.dart';

class ApiServices {
  final String _baseUrl = Constants.baseUrl;
  final Dio _dio;

  ApiServices(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseUrl$endPoint');
    return response.data as List<dynamic>;
  }
}
