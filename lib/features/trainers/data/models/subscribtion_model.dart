class SubscribtionModel {
  Data? data;
  String? message;
  bool? status;

  SubscribtionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  String? trainerId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data.fromJson(Map<String, dynamic> json) {
    trainerId = json['trainer_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

}