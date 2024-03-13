class CategoryBlogsModel {
  List<Data>? data;
  String? message;
  bool? status;


  CategoryBlogsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  String? name;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}