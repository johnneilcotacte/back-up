import 'package:flutter/cupertino.dart';
import 'package:flutter_miniproject/api/auth.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/provider/meal_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// final dateProvider = ChangeNotifierProvider<DateNotifier>((ref) {
//   return DateNotifier();
// });

// class DateNotifier extends ChangeNotifier {
//   String _date = DateFormat.yMMMMd('en_US').format(DateTime.now());

//   String get mealList => _date;

//   void chooseDate({required int direction}) {
//     notifyListeners();
//   }
// }
final weekdateProvider = Provider<WeeklyDate>((ref) {
  return WeeklyDate();
});

class WeeklyDate {
  List<DateTime> getCurrentWeekRange() {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay - 1));
    var lastDayOfWeek = d.add(Duration(days: DateTime.daysPerWeek - weekDay));
    // String firstdayofweek = DateFormat.yMMMMd('en_US').format(firstDayOfWeek);
    // String lastdayofweek = DateFormat.yMMMMd('en_US').format(lastDayOfWeek);
    return [firstDayOfWeek, lastDayOfWeek];
  }
}
