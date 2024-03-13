class MealModel {
  List<Data>? data;

  MealModel({this.data});

  MealModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? name;
  int? unit;
  String? unitCount;
  int? mealId;
  int? categoryId;
  String? mealSystem;
  int? weight;
  int? protein;
  int? fats;
  int? fiber;
  int? calories;
  int? carbs;
  String? img;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    unitCount = json['unit_count'];
    mealId = json['meal_id'];
    categoryId = json['category_id'];
    mealSystem = json['meal_system'];
    weight = json['weight'];
    protein = json['protein'];
    fats = json['fats'];
    fiber = json['fiber'];
    calories = json['calories'];
    carbs = json['carbs'];
    img = json['img'];
  }

}