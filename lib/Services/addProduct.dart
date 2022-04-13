import 'package:flutter_projects/Services/Api/api.dart';
import 'package:flutter_projects/model/product_Model.dart';

class AppProduct {
  Future<ProductModel> addProduct(
      {String title,
      String price,
      String desc,
      String image,
      String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
