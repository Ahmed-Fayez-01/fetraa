class ProductDetailsModel {
  Data? data;
  String? message;
  bool? status;


  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  String? name;
  String? desc;
  String? img;
  String? url;
  String? price;
  int? qty;
  int? fat;
  int? carb;
  int? proten;
  int? calories;
  String? category;
  int? discount;
  List<Images>? images;
  List<Product>? product;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    img = json['img'];
    url = json['url'];
    price = json['price'];
    qty = json['qty'];
    fat = json['fat'];
    carb = json['carb'];
    proten = json['proten'];
    calories = json['calories'];
    category = json['category'];
    discount = json['discount'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add( Images.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add( Product.fromJson(v));
      });
    }
  }

}

class Images {
  String? path;

  Images.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
}

class Product {
  int? id;
  String? name;
  String? img;
  String? price;
  int? discount;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    discount = json['discount'];
  }

}