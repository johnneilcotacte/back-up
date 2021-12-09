import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/model/ingredient.dart';
import 'package:http/http.dart' as http;

//https://firebase.flutter.dev/docs/storage/usage/
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

  Future<bool> createUser({
    required String username,
    required String password,
    required String firstname,
    required String lastname,
    required String email,
  }) async {
    try {
      var url = Uri.parse('https://wca-meal-planner.herokuapp.com/users');
      var response = await http.post(
        url,
        body: {
          "username": "$username",
          "password": "$password",
          "first_name": "$firstname",
          "last_name": "$lastname",
          "email": "$email",
        },
      );
      if (response.statusCode == 201) {
        print(response.body);
        return true;
      } else {
        print('invalid');
        return false;
      }
    } catch (er) {
      print(er);
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
          image: 'https://picsum.photos/250?image=9',
          ingredients: [
            'hotdog',
          ]),
      Meal(
          id: '2',
          name: 'Lechon',
          image:
              'https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/files%2FCornSiLog%20(%20Corned%20Beef%2C%20Sinangag%2C%20Itlog)%20with%20Highlands%20Gold%20Corned%20Beef%20-%20The%20Peach%20Kitchen.png?alt=media&token=20db0da1-6851-49e0-b10c-61192a109f59',
          ingredients: ['pig', 'bawang', 'msg']),
      Meal(
          id: '3',
          name: 'Lechon Paksiw',
          image:
              'https://firebasestorage.googleapis.com/v0/b/flutter-additionals.appspot.com/o/files%2FCornSiLog%20(%20Corned%20Beef%2C%20Sinangag%2C%20Itlog)%20with%20Highlands%20Gold%20Corned%20Beef%20-%20The%20Peach%20Kitchen.png?alt=media&token=20db0da1-6851-49e0-b10c-61192a109f59',
          ingredients: ['lechon', 'tuyo']),
    ];
  }
}
