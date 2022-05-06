// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({String url, String token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    http.Response response = await http.get(Uri.parse(url));
    print('url = $url , token = $token ');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({String url, dynamic body, String token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ');
    }
  }

  Future<dynamic> put({String url, dynamic body, String token}) async {
    Map<String, dynamic> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ');
    }
  }
}
