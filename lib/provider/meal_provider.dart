// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_miniproject/api/CRUD_meal_api.dart';
import 'package:flutter_miniproject/api/auth.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/provider/meal_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mealProvider = ChangeNotifierProvider<MealsNotifier>((ref) {
  return MealsNotifier();
});

class MealsNotifier extends ChangeNotifier {
  final _crud = CRUD();

  List<Meal> _mealList = [];

  List<Meal> get mealList => _mealList;

  Future<List<Meal>> addMeals(
      {required Map<String, dynamic> newMeal,
      required String user_id,
      required String access_token}) async {
    final data = await _crud.createMeal(
        newMeal: newMeal, user_id: user_id, access_token: access_token);

    _mealList = data;

    return _mealList;
  }

  // Future<void> addMeal({required Meal newmeal}) async {
  //   _mealList = [..._mealList, newmeal];

  //   notifyListeners();
  // }

//   Future<void> deleteMeal({required String id}) async {
//     _mealList.removeWhere((everyblog) => everyblog.id == id);

//     notifyListeners();
//   }

//   Future<void> updateMeal({required Meal updatedMeal}) async {
// //https://stackoverflow.com/questions/56283870/how-to-update-a-single-item-in-flutter-list-as-a-best-way/60678253

//     _mealList[_mealList.indexWhere(
//         (everyblog) => everyblog.id == updatedMeal.id)] = updatedMeal;

//     notifyListeners();
//   }
}
