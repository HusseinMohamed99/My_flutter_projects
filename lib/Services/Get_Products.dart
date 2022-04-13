import 'package:flutter_projects/Services/Api/api.dart';
import 'package:flutter_projects/model/product_Model.dart';


class AllProductServices
{
  Future<List<ProductModel>> getAllProducts() async{

    List<dynamic> data =

    await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList =[];

    for(int i = 0 ; i < data.length; i++)
    {
      productsList.add(ProductModel.fromJson(data[i]),);
    }
    return productsList;
  }
}