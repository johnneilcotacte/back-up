import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CUD {
  String _url = 'https://wca-meal-planner.herokuapp.com/';
  Future<Response?> createMeal({required Map<String, dynamic> newMeal}) async {
    try {
      var url = Uri.parse(_url + '');
      var response = await http.post(
        url,
        body: newMeal,
      );

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
