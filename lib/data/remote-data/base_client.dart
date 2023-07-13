import 'package:dio/dio.dart';

class DioClient {
  final Dio _client;

  DioClient({required Dio client}) : _client = client;

  // --------------------------- Get Data --------------------------------------

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {

    final Response response = await _client.get(
      url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // ---------------------------- Post Data ------------------------------------

  Future<Response> post(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    final Response response = await _client.post(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // --------------------------- Delete Data --------------------------------

  Future<Response> delete(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
      }) async {
    final Response response = await _client.delete(url,
        data: data, queryParameters: queryParameters, cancelToken: cancelToken);
    return response;
  }

  // ---------------------------- Update Data ----------------------------------

  Future<Response> put(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    final Response response = await _client.put(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }


}
