class VideoModel {
  List<Data>? data;
  String? message;
  bool? status;


  VideoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? desc;
  String? video;
  String? link;
  String? img;
  Category? category;

  Data(
      {this.id,
        this.name,
        this.desc,
        this.video,
        this.link,
        this.img,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    video = json['video'];
    link = json['link'];
    img = json['img'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['video'] = this.video;
    data['link'] = this.link;
    data['img'] = this.img;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? img;

  Category({this.id, this.name, this.img});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}