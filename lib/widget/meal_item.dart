import 'package:flutter/material.dart';
import 'package:meels_app/Screens/meal_details.dart';

import '../modules/meal.dart';

class Iteam extends StatelessWidget {
  const Iteam({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal(context) {
    Navigator.of(context)
        .pushNamed(MealDetails.routeName, arguments: id)
        .then((value) {
      if (value != null) {
        // removeMeal(value);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        margin: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(children: [
          Stack (
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 10.0,
                right: 10.0,
                child: Container(
                  width: 200.0,
                  color: Colors.black26,
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: const TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.schedule_outlined,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "$duration min",
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.shopping_bag_rounded,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      complexity.toString().split(".")[1],
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money_sharp,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      affordability.toString().split(".")[1],
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
