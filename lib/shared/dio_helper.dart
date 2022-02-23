import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      //  baseUrl: , // ده لو هشغل news app
      baseUrl: 'http://newsapi.org/',
      receiveDataWhenStatusError: true,
      headers: {
        'apiKey':'72790f99830c4be79aa4ef06fad391a1'
      }
    ));
  }

  static Future<Response> getData({
    String? lang = 'en',
    String? token,
    required String path,
    Map<String,dynamic>? query
  }) async {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token
    };
    return await dio.get(path, queryParameters:query);
  }


  static Future<Response> postData({
    String? lang = 'en',
    String? token,
    Map<String,dynamic> ? query,
    required String path,
    required Map<String,dynamic> data
  }) async {
    dio.options.headers={
      //هنا لو اتنفذ الاوبشن ده بيلغي عمل الheaders اللي فوق عشان كدا ببعت content type جديد
      'Content-Type':'application/x-www-form-urlencoded',
      'lang':lang,
      'Authorization':token
    };
    return dio.post(path,queryParameters: query,data: data);
  }




  static Future<List<dynamic>>getAllProduct()async{
    try{
      Response response =await DioHelper.dio.get('products');
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }


  static Future<Response> updateData({
    String? lang = 'en',
    String? token,
    Map<String,dynamic> ? query,
    required String path,
    required Map<String,dynamic> data
  }) async {
    dio.options.headers={
      //هنا لو اتنفذ الاوبشن ده بيلغي عمل الheaders اللي فوق عشان كدا ببعت content type جديد
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token
    };
    return dio.put(path,queryParameters: query,data: data);
  }

}