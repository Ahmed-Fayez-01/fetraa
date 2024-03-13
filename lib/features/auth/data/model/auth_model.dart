class AuthModel {
  Data? data;
  dynamic? message;
  bool? status;

  AuthModel.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  User? user;
  dynamic? token;

  Data.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class User {
  dynamic? id;
  dynamic? name;
  dynamic? email;
  dynamic? phone;
  dynamic? type;
  dynamic? age;
  dynamic? img;

  User.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    age = json['age'];
    img = json['img'];
  }
}