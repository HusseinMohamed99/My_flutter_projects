// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/Services/Api/api.dart';
import 'package:flutter_projects/model/product_Model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {@required String title,
      @required int id,
      @required String price,
      @required String desc,
      @required String image,
      @required String category}) async {
    print('product id  = $id');
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
