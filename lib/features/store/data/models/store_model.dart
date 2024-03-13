class StoreModel {
  List<Data>? data;
  String? message;
  bool? status;


  StoreModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  String? name;
  String? img;
  String? price;
  int? discount;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    discount = json['discount'];
  }

}