import 'dart:typed_data';
import 'package:flutter_miniproject/model/ingredient.dart';

class Meal {
  String? _id;
  String? _name;
  Uint8List? _image;
  List<Ingredient>? _recipes = [];

  Meal({
    String? id,
    String? name,
    Uint8List? image,
    List<Ingredient>? recipes,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _recipes = recipes;
  }
  String? get id => _id;
  String? get name => _name;
  Uint8List? get image => _image;
  List<Ingredient>? get recipes => _recipes;
}
