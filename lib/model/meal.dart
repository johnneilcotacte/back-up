import 'dart:typed_data';
import 'package:flutter_miniproject/model/ingredient.dart';

class Meal {
  String? _id;
  String? _name;
  String? _image;
  List<String>? _recipes = [];

  Meal({
    String? id,
    String? name,
    String? image,
    List<String>? recipes,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _recipes = recipes;
  }
  String? get id => _id;
  String? get name => _name;
  String? get image => _image;
  List<String>? get recipes => _recipes;
}
