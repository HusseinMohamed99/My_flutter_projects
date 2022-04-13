import 'dart:convert';

import 'package:flutter_projects/Services/Api/api.dart';
import 'package:http/http.dart' as http;


class GetCategory
{
  Future <List<dynamic>> getAllCateogires()async

  {
    List<dynamic> data =

    await Api().get(url: 'https://fakestoreapi.com/products/categories');

         return data;
  }
}


