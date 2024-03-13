class TrainersModel {
  List<Data>? data;
  String? message;
  bool? status;

  TrainersModel({this.data, this.message, this.status});

  TrainersModel.fromJson(Map<String, dynamic> json) {
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
  String? phone;
  String? img;
  bool? subscrip;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    img = json['img'];
    subscrip = json['Subscrip'];
  }

}