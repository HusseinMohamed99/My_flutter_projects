import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper
{
  static Dio dio;
  static init()
  {
    dio = Dio(
        BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));


  }  // 1. Login
  static Future<Response> postData({
  @required String url,
    Map<String , dynamic> query,
    @required Map<String , dynamic> data,
    String lang = 'en',
    String token,
})async
  {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token??'',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  // 2. GetHomeData
  static Future<Response> getData({
  @required String url,
    Map<String , dynamic> query,
    String lang = 'en',
    String token,
})async
  {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token??'',
    };
    return await dio.get(
      url,
      queryParameters: query??null,

    );
  }

// 2. UpdateUserData
  static Future<Response> putData({
    @required String url,
    Map<String , dynamic> query,
    @required Map<String , dynamic> data,
    String lang = 'en',
    String token,
  })async
  {
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization' : token??'',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}


