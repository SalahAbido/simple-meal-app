import 'package:flutter/material.dart';

import 'package:meels_app/modules/meal.dart';
import 'package:meels_app/widget/meal_item.dart';

class CategoryDitails extends StatefulWidget {
  const CategoryDitails({
    Key? key,
    required this.available,
  }) : super(key: key);
  static const routename = "/category_details";
  final List<Meal> available;

  @override
  State<CategoryDitails> createState() => _CategoryDitailsState();
}

class _CategoryDitailsState extends State<CategoryDitails> {
  late String title;
  late List<Meal> Targetmeals;

  @override
  void didChangeDependencies() {
    final rt =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String id = rt["id"]!;
    title = rt["title"]!;
    Targetmeals = widget.available.where((element) {
      return element.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  void RemoveMeal(String mealid) {
    setState(() {
      Targetmeals.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Targetmeals.length,
          itemBuilder: (context, index) {
            return Iteam(
              title: Targetmeals[index].title,
              id: Targetmeals[index].id,
              affordability: Targetmeals[index].affordability,
              complexity: Targetmeals[index].complexity,
              duration: Targetmeals[index].duration,
              imageUrl: Targetmeals[index].imageUrl,
            );
          },
        ),
      ),
    );
  }
}
