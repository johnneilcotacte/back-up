import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/model/ingredient.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  String _meal_uri = '';

  Future<bool> logInUser(
      {required String email, required String password}) async {
    //Map<String, String> ingredient = {'Pork1k', "Fish": "0.5kg"};

    try {
      var url = Uri.parse('https://reqres.in/api/login');
      var response = await http.post(
        url,
        body: {
          "email": "$email",
          "password": "$password",
          // "ingredient": "$ingredient"
        },
      );

      if (response.statusCode == 200) {
        // print(response.body);
        return true;
      } else {
        // print('invalid');
        return false;
      }
    } catch (er) {
      throw Exception(er);
    }
  }

  void createUser({
    required String username,
    required String password,
    required String firstname,
    required String lastname,
    required String email,
    required String age,
  }) async {
    try {
      var url = Uri.parse('https://example.com/whatsit/create');
      var response = await http.post(
        url,
        body: {
          "username": "$username",
          "password": "$password",
          "first_name": "$firstname",
          "last_name": "$lastname",
          "email": "$email",
          "age": "$age"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('invalid');
      }
    } catch (er) {
      throw Exception(er);
    }
  }
}

class InitialDummyMeals {
  Future<List<Meal>> initializeListBlog() async {
    Uint8List? _image0 = (await rootBundle.load('assets/images/hotdog.png'))
        .buffer
        .asUint8List();
    Uint8List? _image1 = (await rootBundle.load('assets/images/lechon.jpg'))
        .buffer
        .asUint8List();
    Uint8List? _image2 = (await rootBundle.load('assets/images/paksiw.jpg'))
        .buffer
        .asUint8List();

    return [
      Meal(
          id: '1',
          name: 'hotdog',
          image:
              'https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/files%2FFilipino%20Breakfast_%20Tuyo%2C%20Tocino%2C%20Salted%20Egg%2C%20and%20Tomato%20-%20The%20Peach%20Kitchen.jpg?alt=media&token=8cf86462-e44b-4558-a804-580c28eb78e3',
          recipes: [
            'hotdog',
          ]),
      Meal(
          id: '2',
          name: 'Lechon',
          image:
              'https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/files%2FFilipino%20Breakfast_%20Tuyo%2C%20Tocino%2C%20Salted%20Egg%2C%20and%20Tomato%20-%20The%20Peach%20Kitchen.jpg?alt=media&token=8cf86462-e44b-4558-a804-580c28eb78e3',
          recipes: ['pig', 'bawang', 'msg']),
      Meal(
          id: '3',
          name: 'Lechon Paksiw',
          image:
              'https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/files%2FFilipino%20Breakfast_%20Tuyo%2C%20Tocino%2C%20Salted%20Egg%2C%20and%20Tomato%20-%20The%20Peach%20Kitchen.jpg?alt=media&token=8cf86462-e44b-4558-a804-580c28eb78e3',
          recipes: ['lechon', 'tuyo']),
    ];
  }
}
