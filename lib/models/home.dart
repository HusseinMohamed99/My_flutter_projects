class HomeModel {
  bool status;
  HomeDataModel data;


  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }

}

class HomeDataModel {
  List<Banners> banners =[];
  List<Products> products =[];



  HomeDataModel.fromJson(Map<String, dynamic> json)
  {
    json['banners'].forEach((element) {
      banners.add(Banners.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(Products.fromJson(element));    });
  }
    }

class Banners {
  int id;
  String image;


  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

}

class Products {
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
