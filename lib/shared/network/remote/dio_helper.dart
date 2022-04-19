import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper
{
  static  Dio dio;
  static init()
  {
    dio = Dio(
        BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));


  }
        // 1. POST REQUEST Data //
  static Future<Response> postData({
        @required String url,
    @required Map<String,dynamic> data,
    Map<String,dynamic>query,
    String token,
    String lang  = 'ar',
  }) async {
    dio.options.headers = {

      'Content-Type': 'application/json',
      'Authorization': token??'',
      'lang': lang,
    };
    return await dio.post(
        url,
        queryParameters: query,
      data: data,
    );
  }
  static Future<Response> getData({
    @required String url,
    Map<String,dynamic>query,
    String token,
    String lang  = 'en',
    Map<String,dynamic> data,
  }) async {
    dio.options.headers = {

      'Content-Type': 'application/json',
      'Authorization': token??'',
      'lang': lang,
    };
    return await dio.get(
      url,
      queryParameters: query ,

    );
  }

  static Future<Response> putData({
    @required String url,
    @required Map<String,dynamic> data,
    Map<String,dynamic>query,
    String token,
    String lang  = 'en',
  }) async {
    dio.options.headers = {

      'Content-Type': 'application/json',
      'Authorization': token??'',
      'lang': lang,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> deleteData({
    @required String url,
    String token,
    String lang  = 'en',
  }) async {
    dio.options.headers = {

      'Content-Type': 'application/json',
      'Authorization': token??'',
      'lang': lang,
    };
    return await dio.delete(url);
  }
}




