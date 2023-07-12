import 'package:dio/dio.dart';

class DioClient {
  final Dio _client;

  DioClient({required Dio client}) : _client = client;

  // --------------------------- Get Data --------------------------------------

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    _client.options.headers = {
      'Content-Type': 'application/json',
    };
    return _client.get(url, queryParameters: query);
  }

  // ---------------------------- Post Data ------------------------------------

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) {
    _client.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json'
    };

    return _client.post(url, queryParameters: query, data: data);
  }

  // --------------------------- Post Data Files--------------------------------

  Future<Response> postDataFiles1({
    required String url,
    dynamic fileData,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromBytes(fileData),
    });

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };

    return _client.post(
      url,
      data: formData,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> postDataFiles({
    required String url,
    bool convert = false,
    dynamic file,
    // Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) {
    _client.options.headers = {
      'lang': lang,
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    return _client.post(url, queryParameters: query, data: file);
  }

  // ---------------------------- Update Data ----------------------------------

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) {
    _client.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };

    return _client.put(url, queryParameters: query, data: data);
  }

  // -------------------------- Delete Data ------------------------------------

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) {
    _client.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return _client.delete(url, queryParameters: query);
  }
}
