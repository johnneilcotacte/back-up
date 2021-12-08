import 'package:http/http.dart' as http;

class CUD {
  Future<bool> logInUser(
      {required String email, required String password}) async {
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
}
