import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/model/recipe.dart';

class InitialDummyMeals {
  Future<List<Meal>> initializeListBlog() async {
    Uint8List? _image0 =
        (await rootBundle.load('assets/images/picture1_foodblog.jpg'))
            .buffer
            .asUint8List();
    Uint8List? _image1 =
        (await rootBundle.load('assets/images/picture2_foodblog.jpg'))
            .buffer
            .asUint8List();
    Uint8List? _image2 =
        (await rootBundle.load('assets/images/picture3_foodblog.jpg'))
            .buffer
            .asUint8List();

    return [
      Meal(id: '1', name: 'hotdog', image: _image1, recipes: [
        Recipe(id: 'b1', name: 'hotdog', isBought: false),
      ]),
      Meal(id: '2', name: 'Lechon', image: _image0, recipes: [
        Recipe(id: 'a1', name: 'pig', isBought: true),
        Recipe(id: 'a2', name: 'bawang', isBought: true),
        Recipe(id: 'a3', name: 'MSG', isBought: true),
      ]),
      Meal(id: '3', name: 'Lechon Paksiw', image: _image2, recipes: [
        Recipe(id: 'c1', name: 'lechon', isBought: true),
        Recipe(id: 'c2', name: 'tuyo', isBought: false),
      ]),
    ];
  }
}
