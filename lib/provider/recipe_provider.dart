import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_miniproject/model/ingredient.dart';

final recipeProvider = ChangeNotifierProvider<RecipeNotifier>((ref) {
  return RecipeNotifier();
});

class RecipeNotifier extends ChangeNotifier {
  List<Ingredient> _recipes = [Ingredient(name: 'initial')];
  List<Ingredient> get recipes => _recipes;

  //GET DATA FROM API
  //Get list of recipes from remote API
  Future<List<Ingredient>> getRecipes() async {
    final data = await getRecipes();
    _recipes = data;
    return [Ingredient(name: 'initial2')];
  }

  //ADD NEW DATA FROM API

  Future<void> addRecipe({required Ingredient body}) async {
    final newRecipe = body;

    _recipes = [..._recipes, newRecipe];
    notifyListeners();
  }

  //DELETE DATA FROM API
/*
  Future<void> deleteTodo({required Ingredient id}) async {
    //final deleteAPI = await deleteAPI(id); deletes data in the backend

    _recipes.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}*/

// final recipeProvider = ChangeNotifierProvider<RecipeNotifier>((ref) {
//   return RecipeNotifier();
// });

// class RecipeNotifier extends ChangeNotifier {

//   List<Todo> _recipes = [
//     Todo(id: '1', body: 'Todo 1', date: DateTime.now().toString())
//   ];
//   List<Todo> get recipes => _recipes;

//   void addRecipe({required Ingredient body}) {

//     final newRecipe = Todo(
//       id: (_recipes.length + 1).toString(),
//       body: body,
//       date: DateTime.now().toString(),
//     );

//     _recipes = [..._recipes, newRecipe];

//     notifyListeners();
//   }

//   void deleteTodo({required Ingredient id}) {
//     _recipes.removeWhere((todo) => todo.id == id);
//     notifyListeners();
//   }

}
