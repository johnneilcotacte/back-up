import 'package:flutter_miniproject/model/meal.dart';

class MealPostChecker {
  static bool isComplete(Meal meal) {
    if (meal.id != '' &&
            meal.name != '' &&
            meal.ingredients !=
                [] //&&meal.image != null //TODO: uncomment this later
        ) {
      return true;
    }
    return false;
  }
}
