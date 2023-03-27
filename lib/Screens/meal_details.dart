import 'package:flutter/material.dart';
import 'package:meels_app/dummy_data.dart';
import 'package:meels_app/modules/meal.dart';
import 'package:meels_app/widget/meal_details_widgets.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.removeFromFavor, required this.isinfavorite}) : super(key: key);
  static String routeName = "MealDetails";
final Function removeFromFavor;
final Function isinfavorite;
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        (DUMMY_MEALS.firstWhere((element) => element.id == id));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:() => removeFromFavor(id),
        child:  Icon(
            isinfavorite(id)?Icons.star:Icons.star_border_outlined
        ),
      ),
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                margin: const EdgeInsets.all(15.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    child: Image.network(selectedMeal.imageUrl))),
            const buildTitleBody(text: "Ingredient"),
            BuildBodyDetails(
                child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.amberAccent,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ));
              },
            )),
            const buildTitleBody(text: "Steps"),
            BuildBodyDetails(
                child: ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      style: ListTileStyle.list,
                      leading:
                          CircleAvatar(child: Text((index + 1).toString())),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    )
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
