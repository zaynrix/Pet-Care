import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/helper.dart';


class DioClient {
  final Dio _client;

  void showSnackBarAndDebugPrint(String message) {
    // Helpers.showSnackBar(message: message);
    Helpers.showDialog(message: message , status: LoadingStatusOption.error);
    debugPrint(message);
  }


  DioClient({required Dio client}) : _client = client;

  Future<bool> _isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<Response> _handleRequest(Function() requestFunction) async {
    bool isConnected = await _isConnected();
    if (!isConnected) {
      showSnackBarAndDebugPrint("No Internet Connection");
      throw DioException(
        type:DioExceptionType.unknown,
        error: 'No internet connection.',
        requestOptions: RequestOptions(),
      );
    }
    return requestFunction();
  }

  // --------------------------- Get Data --------------------------------------

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    return _handleRequest(() => _client.get(
      url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    ));
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
    return _handleRequest(() => _client.post(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ));
  }

  // --------------------------- Delete Data --------------------------------

  Future<Response> delete(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
      }) async {
    return _handleRequest(() => _client.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    ));
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
    return _handleRequest(() => _client.put(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ));
  }
}
