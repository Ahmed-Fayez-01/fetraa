class MealDetailsModel {
  Data? data;

  MealDetailsModel({this.data});

  MealDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? name;
  String? components;
  String? recipe;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    components = json['components'];
    recipe = json['recipe'];
  }

}