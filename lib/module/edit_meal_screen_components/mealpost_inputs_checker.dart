import 'package:flutter_miniproject/model/meal.dart';

class MealPostChecker {
  static bool isComplete(Meal meal) {
    if (meal.id != '' &&
        meal.name != '' &&
        meal.ingredients != [] &&
        meal.image != null) {
      return true;
    }
    return false;
  }
}
