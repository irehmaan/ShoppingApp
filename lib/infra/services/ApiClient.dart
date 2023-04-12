import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio();
  // We are going to use Future keyword as we made N/w call.
  // Data is not fetched instantly, so like future whenever data is ready.

  Future<Response> get(url) {
    return dio.get(url);
  }

  post(url, data) {}
}
