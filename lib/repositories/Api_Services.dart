import 'dart:convert';

import 'package:dio/dio.dart';

enum ApiCallType { get, post, put, delete }

class NetworkCall {
  Future<List<dynamic>?> handleApi({
    required String endpoint,
    bool isRequiredToken = false,
    Map<String, dynamic> params = const {},
    Map<String, dynamic>? queryParameters,
    ApiCallType callType = ApiCallType.get,
    final bool isFormData = false,
  }) async {
    Dio dio = Dio();
    late Response response;
    final url = endpoint;

    FormData urlParams = FormData.fromMap(params);

    switch (callType) {
      case ApiCallType.get:
        response = await dio.get(url,
            queryParameters: params,
            options: Options(
                headers: isRequiredToken == true
                    ? {
                        'Authorization': 'Bearer  ',
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }
                    : {
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }));
        break;

      case ApiCallType.post:
        response = await dio.post(url,
            data: isFormData ? urlParams : params,
            queryParameters: queryParameters,
            options: Options(
                headers: isRequiredToken == true
                    ? {
                        'Authorization': 'Bearer ',
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }
                    : {
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }));
      case ApiCallType.put:
        response = await dio.put(url,
            data: params,
            options: Options(
                headers: isRequiredToken == true
                    ? {
                        'Authorization': 'Bearer ',
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }
                    : {
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }));
        break;
      case ApiCallType.delete:
        response = await dio.delete(url,
            data: params,
            options: Options(
                headers: isRequiredToken == true
                    ? {
                        'Authorization': 'Bearer ',
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }
                    : {
                        'Content-Type': 'application/x-www-form-urlencoded',
                      }));
        break;
    }
    if (response.statusCode == 200) {
      // List<dynamic> responseData = json.decode(response.data['data']);
      List<dynamic> responseData = json.decode(response.data);
      return responseData;
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized user');
    } else {
      return null;
    }
  }
}
