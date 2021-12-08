// import 'dart:typed_data';
// import 'package:flutter_miniproject/model/ingredient.dart';

// class Meal {
//   String? _id;
//   String? _name;
//   Uint8List? _image;
//   List<Ingredient>? _recipes = [];

//   Meal({
//     String? id,
//     String? name,
//     Uint8List? image,
//     List<Ingredient>? recipes,
//   }) {
//     _id = id;
//     _name = name;
//     _image = image;
//     _recipes = recipes;
//   }
//   String? get id => _id;
//   String? get name => _name;
//   Uint8List? get image => _image;
//   List<Ingredient>? get recipes => _recipes;
// }

import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_miniproject/model/ingredient.dart';

//https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
class Meal {
  String? _id;
  String? _name;
  String? _image;
  List<String?>? _category;
  List<String?>? _ingredients;

  Meal({
    String? id,
    String? name,
    String? image,
    List<String?>? category ,
    List<String?>? ingredients,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _category = category;
    _ingredients = ingredients;
  }

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json['userId'],
        name: json['mealName'] as String? ?? '',
        image: json['mealImage'] as String? ?? '',
        category: json['mealType'] as List<String?>? ?? [],
        ingredients: json['ingredients'] as List<String?>? ?? [],
      );
  String? get id => _id;
  String? get name => _name;
  String? get image => _image;

  List<String?>? get category => _category;
  List<String?>? get ingredients => _ingredients;
}
