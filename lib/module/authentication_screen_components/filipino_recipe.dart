import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_miniproject/module/authentication_screen_components/filipino_recipe_card.dart';

class FilipinoRecipe extends HookWidget {
  FilipinoRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        width: 850,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILIPINO RECIPE',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                FilipinoRecipeCard(
                  name: 'Vegan Filipino Scrambled Egg',
                  image: 'assets/images/f1.jpg',
                  subtitle:
                      'Learn how to make these easy Filipino scrambled eggs!',
                ),
                FilipinoRecipeCard(
                  name: 'Tuyo, Tocino, Salted Egg, and Tomato',
                  image: 'assets/images/f2.jpg',
                  subtitle: 'This kept my tummy full for half a day!',
                ),
                FilipinoRecipeCard(
                  name: 'Crispy Kare-Kare',
                  image: 'assets/images/f3.jpg',
                  subtitle:
                      'Crispy and Juicy Meat of Lechon Kawali and the delicious nutty sauce of kare-kare. WoW-lap!',
                ),
                FilipinoRecipeCard(
                  image: 'assets/images/f4.jpg',
                  name: 'Adobo Loco Moco',
                  subtitle:
                      'This Adobo Loco Moco marries the rice plate with the classic Filipino Chicken Adobo.',
                ),
                FilipinoRecipeCard(
                  image: 'assets/images/f5.jpg',
                  name: 'Lumpia Shanghai ',
                  subtitle:
                      'Lumpia Shanghai is a perfect appetizer and finger food for parties!',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
