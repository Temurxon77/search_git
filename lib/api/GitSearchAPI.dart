import 'package:connectivity/connectivity.dart';
import 'package:git_search_api/interceptors/connectivity_retrier.dart';
import 'package:git_search_api/interceptors/retry_interceptor.dart';

import 'package:dio/dio.dart';

import 'package:git_search_api/models/search.dart';



class SearchApiProvider{
  final String accessToken = "2fb7040baa4515857996b473a1dbb4227ffa9c21";
  Dio _dio;

  SearchApiProvider(){
    BaseOptions options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000,headers: {
      "Authorization": "Bearer $accessToken"
    });
      _dio = Dio(options);
      _dio.interceptors.add(
      RetryConnectionInterceptor(
        requestRetrier: DioConnectivityRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
      //_dio.interceptors.add(LoggingInterceptor());
  }

  Future<SearchResponse> getItems({String query}) async {
    try {
      Response response = await _dio.get("https://api.github.com/search/code?q=$query&per_page=10&page=1");
      //print(response);
      if(response.statusCode == 200){
        return SearchResponse.fromJson(response.data);
      }
      return null;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchResponse.withError("$error");
    }
  }

  String _handleErrorType(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Запрос к серверу отменён";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "время запроса к серверу превышен";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "нет подключения к интернету";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "ожидание отклика от сервера";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Код ошибки: ${dioError.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Отправка интервала к серверу";
          break;
      }
    } else {
      errorDescription = "Что-то пошло не так...";
    }
    return errorDescription;
  }
}