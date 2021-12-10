// ignore_for_file: non_constant_identifier_names

import 'package:flutter_miniproject/model/list_of_meal.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//https://www.youtube.com/watch?v=KcRtURq-Ww8&t=820s
class CRUD {
  String _url = 'https://wca-meal-planner.herokuapp.com/';
  Future<List<Meal>> createMeal(
      {required Map<String, dynamic> newMeal,
      required String user_id,
      required String access_token}) async {
    try {
      var url = Uri.parse(_url + '');
      var response = await http.post(url,
          body: newMeal,
          headers: {'user_id': user_id, 'access_token': access_token});

      if (response.statusCode == 200) {
        final result = mealsDataFromJson(response.body);

        return result.data;
      } else {
        // print('invalid');
        return [];
      }
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<Response?> updateMeal(
      {required Map<String, dynamic> newMeal,
      required String user_id,
      required String access_token}) async {
    try {
      var url = Uri.parse(_url + '');
      var response = await http.patch(url,
          body: newMeal,
          headers: {'user_id': user_id, 'access_token': access_token});

      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('invalid');
        return response;
      }
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<Response?> deleteMeal(
      {required Map<String, dynamic> newMeal,
      required String user_id,
      required String access_token}) async {
    try {
      var url = Uri.parse(_url + '');
      var response = await http.delete(url,
          body: newMeal,
          headers: {'user_id': user_id, 'access_token': access_token});

      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('invalid');
        return response;
      }
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<Response?> getMeals(
      {required Map<String, dynamic> newMeal,
      required String user_id,
      required String access_token}) async {
    try {
      var url = Uri.parse(_url + '');
      var response = await http.get(url,
          headers: {'user_id': user_id, 'access_token': access_token});

      if (response.statusCode == 200) {
        // print(response.body);
        return response;
      } else {
        // print('invalid');
        return response;
      }
    } catch (er) {
      throw Exception(er);
    }
  }
}
