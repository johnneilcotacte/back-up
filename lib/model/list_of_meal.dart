import 'dart:convert';

import 'package:flutter_miniproject/model/meal.dart';

// https://github.com/themaaz32/infinite_list_pagination.git
MealsData mealsDataFromJson(String str) => MealsData.fromJson(json.decode(str));

//String passengersDataToJson(MealsData data) => json.encode(data.toJson());

class MealsData {
  MealsData({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  int totalPassengers;
  int totalPages;
  List<Meal> data;

  factory MealsData.fromJson(Map<String, dynamic> json) => MealsData(
        totalPassengers: json["totalMeals"], //change this
        totalPages: json["totalPages"],
        data: List<Meal>.from(json["data"].map((x) => Meal.fromJson(x))),
      );
}
