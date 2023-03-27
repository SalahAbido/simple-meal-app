import 'package:flutter/material.dart';
import 'package:meels_app/Screens/category_screen.dart';
import 'package:meels_app/Screens/favorite_screen.dart';

import '../modules/meal.dart';
import '../widget/drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.favoriteMeals}) : super(key: key);
  final List<Meal> favoriteMeals;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<List> screens;
  int selectedIndex = 0;

  @override
  void initState() {
    screens = [
      [
        "Category",
        const CategoryScreen(),
      ],
      [
        " Your Favorite",
        FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
      ]
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[selectedIndex][0]),
      ),
      body: screens[selectedIndex][1],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "favorite"),
        ],
        elevation: 5.0,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      drawer: const DrawerMain(),
    );
  }
}
