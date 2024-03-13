class BlogModel {
  List<Data>? data;
  String? message;
  bool? status;


  BlogModel.fromJson(Map<String, dynamic> json) {
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
  String? category;
  String? img;
  String? title;
  String? desc;
  String? admin;
  String? createdAt;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    img = json['img'];
    title = json['title'];
    desc = json['desc'];
    admin = json['admin'];
    createdAt = json['created_at'];
  }

}