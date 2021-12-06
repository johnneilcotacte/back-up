// import 'package:flutter/cupertino.dart';
// import 'package:flutter_miniproject/api/auth.dart';
// import 'package:flutter_miniproject/provider/userauth_api_provider.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final authProvider = ChangeNotifierProvider<GetPostUser>((ref) {
//   final initialauth = ref.watch(authAPIProvider).auth;
//   return GetPostUser(auth: initialauth);
// });

// class GetPostUser extends ChangeNotifier {
//   final AuthAPI auth;
//   GetPostUser({
//     required this.auth,
//   });

//   bool _loginstatus = false;
//   bool get loginstatus => _loginstatus;

//   Future<void> addMeal(
//       {required String email, required String password}) async {
//     final data = await auth.logInUser(email: email, password: password);
//     _loginstatus = data;

//     notifyListeners();
//   }
// }
