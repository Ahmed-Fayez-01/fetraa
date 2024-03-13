
import 'dart:io';

import 'package:fetraa/features/store/data/models/store_model.dart' as storeData;
import 'package:fetraa/features/trainers/data/models/trainers_model.dart' as trainerData;
import 'package:flutter/material.dart';




class AppConstants {
  static bool? hasInternet;
  static bool hideMeasure=false;
  static File? file;
  static double proteinMeal1=0;
  static double proteinMeal2=0;
  static double proteinMeal3=0;
  static double fatMeal1=0;
  static double fatMeal2=0;
  static double fatMeal3=0;
  static double carbMeal1=0;
  static double carbMeal2=0;
  static double carbMeal3=0;
  static List mealsToDesign=[];
  static List<trainerData.Data> model=[];
  static List<trainerData.Data> foundedTrainers=[];
  static List<storeData.Data> storeModel=[];
  static List<storeData.Data> foundedProducts=[];
  static sp10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static sp15(context){
    var height=MediaQuery.of(context).size.height*.016;
    return height;
  }
  static  sp20(context){
    var height=MediaQuery.of(context).size.height*.022;
    return height;
  }
  static  sp30(context){
    var height=MediaQuery.of(context).size.height*.032;
    return height;
  }

  static  height5(context){
    var height=MediaQuery.of(context).size.height*.006;
    return height;
  }
  static  height10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static  height15(context){
    var height=MediaQuery.of(context).size.height*.018;
    return height;
  }
  static  height20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  height30(context){
    var height=MediaQuery.of(context).size.height*.030;
    return height;
  }
  static  height55(context){
    var height=MediaQuery.of(context).size.height*.075;
    return height;
  }

  static  width5(context){
    var height=MediaQuery.of(context).size.height*.0075;
    return height;
  }
  static  width10(context){
    var height=MediaQuery.of(context).size.height*.015;
    return height;
  }
  static  width15(context){
    var height=MediaQuery.of(context).size.height*.02;
    return height;
  }
  static  width20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  width30(context){
    var height=MediaQuery.of(context).size.height*.036;
    return height;
  }
  static  width50(context){
    var height=MediaQuery.of(context).size.height*.056;
    return height;
  }
  static  height200(context){
    var height=MediaQuery.of(context).size.height*.4;
    return height;
  }
}