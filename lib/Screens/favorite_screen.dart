import 'package:flutter/material.dart';

import '../modules/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);
  static const routename = "Favorite";
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: favoriteMeals.isEmpty
            ? const Center(
                child: Text("You have no favorite yet"),
              )
            : ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return Iteam(
              title: favoriteMeals[index].title,
              id: favoriteMeals[index].id,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              imageUrl: favoriteMeals[index].imageUrl,
            );
          },
        ));
  }
}
