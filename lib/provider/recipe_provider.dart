import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_miniproject/model/ingredient.dart';

final recipeProvider = ChangeNotifierProvider<RecipeNotifier>((ref) {
  return RecipeNotifier();
});

class RecipeNotifier extends ChangeNotifier {
  List<String> _ingredients = [];
  List<String> get ingredients => _ingredients;

  //GET DATA FROM API
  //Get list of ingredients from remote API
  Future<List<String>> getRecipes() async {
    final data = await getRecipes();
    _ingredients = data;
    return ['initial2'];
  }

  //ADD NEW DATA FROM API

  Future<void> addRecipe({required String body}) async {
    final newRecipe = body;

    _ingredients = [..._ingredients, newRecipe];
    notifyListeners();
  }

  //DELETE DATA FROM API

  Future<void> deleteTodo({required String ingredient}) async {
    //final deleteAPI = await deleteAPI(id); deletes data in the backend

    _ingredients.removeWhere((ing) => ing == ingredient);
    notifyListeners();
  }
}

// final recipeProvider = ChangeNotifierProvider<RecipeNotifier>((ref) {
//   return RecipeNotifier();
// });

// class RecipeNotifier extends ChangeNotifier {

//   List<Todo> _ingredients = [
//     Todo(id: '1', body: 'Todo 1', date: DateTime.now().toString())
//   ];
//   List<Todo> get ingredients => _ingredients;

//   void addRecipe({required String body}) {

//     final newRecipe = Todo(
//       id: (_ingredients.length + 1).toString(),
//       body: body,
//       date: DateTime.now().toString(),
//     );

//     _ingredients = [..._ingredients, newRecipe];

//     notifyListeners();
//   }

//   void deleteTodo({required String id}) {
//     _ingredients.removeWhere((todo) => todo.id == id);
//     notifyListeners();
//   }


