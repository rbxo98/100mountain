import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class DioFactory{
  static Dio getDio(){
    Dio dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get("BASE_URL"),
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {
          "x-api-version":3
        }
      ),
    );
    return dio;
  }
}
