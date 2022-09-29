import 'package:covidapp/src/http/custom_exception.dart';
import 'package:covidapp/src/models/formatted_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:covidapp/src/http/network.dart' as _networkutils;
import 'dart:developer' as _logger;

abstract class ApiManager {
  late Dio dio;

  ///Leaving it open because it is an open source api
  final baseURL = 'https://corona.lmao.ninja/v2';
  final Reader read;

  ApiManager(this.read) {
    final options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 90 * 1000, // 90 seconds
    );

    dio = Dio(options);
  }

  //GET
  Future<FormattedResponse> getHttp(String route,
      {Map<String, dynamic>? params, bool formdata = false}) async {
    setHeader(formdata: formdata);
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '$baseURL$route';
    return makeRequest(dio.get(
      fullRoute,
      queryParameters: params,
    ));
  }

  Future<FormattedResponse> makeRequest(Future<Response> future) async {
    Response? response;
    try {
      response = await future;

      if (kDebugMode) {
        _logger.log('code  ${response.statusCode}');
        _logger.log('response data  ${response.data}');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        _logger.log('HTTP SERVICE ERROR MESSAGE: ${e.message}');
        _logger.log('HTTP SERVICE ERROR DATA: ${e.response?.data}');
      }

      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Connection Timeout",
          success: false,
        );
      } else if (e.type == DioErrorType.other) {
        if (e.message.contains('SocketException')) {
          return FormattedResponse(
            data: response?.data,
            responseCodeError:
                "Oops! An error occured. Please check your internet and try again.",
            success: false,
          );
        }
      } else if (e.response!.statusCode == 401 ||
          e.response!.statusCode == 407) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Session Expired",
          success: false,
        );
      } else if (e.response!.statusCode == 404) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Oops! Resource not found",
          success: false,
        );
      } else if (e.response!.statusCode == 500 ||
          e.response!.statusCode == 403) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError:
              "Oops! It's not you, it's us. Give us a minute and then try again.",
          success: false,
        );
      } else if (e.response!.statusCode == 400) {
        return FormattedResponse(
          data: e.response?.data,
          success: false,
        );
      } else if (e.type == DioErrorType.response ||
          e.type == DioErrorType.other) {
        return FormattedResponse(
          data: e.response?.data,
          responseCodeError: "Oops! An error occured.",
          success: false,
        );
      }
    } catch (err) {
      if (err is DioError) {
        throw const CustomException('Something went wrong');
      }
    }
    if (response?.data != null && response?.data.isNotEmpty) {}
    return FormattedResponse(
      data: response?.data,
      success: "${response?.statusCode}".startsWith('2'),
    );
  }

  setHeader({bool formdata = false, bool formEncoded = false}) async {
    final Map<String, dynamic> header = {
      'content-type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      // 'AppID': appID,
      // 'AppKey': apiKey,
      'Authorization': 'Mobile',
      'Accept': '*/*'
    };
    // if (await read(secureStorageProvider).hasToken()) {
    //   header['Authorization'] =
    //       'Bearer ${await read(secureStorageProvider).getAccessToken()}';
    // }

    dio.options.headers.addAll(header);
  }
}
