import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/model/meal.dart';
import 'package:flutter_miniproject/module/screens/recipe_screen.dart';

class MealItem extends HookWidget {
  final Meal meal;
  //final Uint8List? image,
  const MealItem({
    required this.meal,
    //this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Change this to pop with data for ChangeMealScreen, add ternary operator
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => RecipeScreen()));
      },
      child: GridTile(
        child: Image.memory(meal.image!, fit: BoxFit.cover),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            meal.name!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
