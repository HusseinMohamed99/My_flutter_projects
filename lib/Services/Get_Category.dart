// ignore_for_file: unused_import, file_names

import 'dart:convert';

import 'package:flutter_projects/Services/Api/api.dart';
import 'package:http/http.dart' as http;

class GetCategory {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
