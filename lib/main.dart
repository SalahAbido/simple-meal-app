import 'package:flutter/material.dart';
import 'package:meels_app/Screens/category_ditails.dart';
import 'package:meels_app/Screens/favorite_screen.dart';
import 'package:meels_app/Screens/filter_screen.dart';
import 'package:meels_app/Screens/meal_details.dart';
import 'package:meels_app/dummy_data.dart';

import 'Screens/category_screen.dart';
import 'Screens/home_screen.dart';
import 'modules/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeal = DUMMY_MEALS.where((element) {
        if (filters['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void togglefavorite(String mealid) {
    final int existing_index =
        favoriteMeals.indexWhere((element) => element.id == mealid);
    if (existing_index >= 0) {
      setState(() {
        favoriteMeals.removeAt(existing_index);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }
  bool isMealFavorite(String id ){
return favoriteMeals.any((element) => element.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20.0,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          primarySwatch: Colors.pink,
          appBarTheme: const AppBarTheme(color: Colors.amber)),
      // home: CategoryScreen(),
      routes: {
        "/": (context) => HomeScreen(
              favoriteMeals: favoriteMeals,
            ),
        CategoryDitails.routename: (context) =>
            CategoryDitails(available: availableMeal),
        // FavoriteScreen.routename: (context) =>
        //     FavoriteScreen(favoriteMeals: favoriteMeals),
        FilterScreen.routename: (context) =>
            FilterScreen(saveFilter: _setfilters, currentFilter: filters),
        MealDetails.routeName: (context) =>  MealDetails(isinfavorite: isMealFavorite,removeFromFavor: togglefavorite,),
      },
    );
  }
}
