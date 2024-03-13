class SliderModel {
  List<Data>? data;
  String? message;
  bool? status;

  SliderModel({this.data, this.message, this.status});

  SliderModel.fromJson(Map<String, dynamic> json) {
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
  String? image;

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

}