import 'package:flutter/material.dart';
import 'package:meels_app/widget/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    Key? key,
    required this.saveFilter,
    required this.currentFilter,
  }) : super(key: key);
  static const routename = "Filters";
  final Function saveFilter;
  final Map<String, bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  @override
  void initState() {
    isGlutenFree=widget.currentFilter['gluten']!;
    isLactoseFree=widget.currentFilter['lactose']!;
    isVegan=widget.currentFilter['vegan']!;
    isVegetarian=widget.currentFilter['vegetarian']!;

  }
  Widget buildSwitchListTile({
    required String title,
    required String Sub,
    required bool value,
    required Function(bool) onchange,
  }) {
    return SwitchListTile(
      activeColor: Colors.amber,
      // secondary: Icon(icon,color: Colors.blue,size: 40.0,),
      onChanged: onchange,
      value: value,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle: Text(Sub, style: Theme.of(context).textTheme.bodyText1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters "),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilter = {
                  "gluten": isGlutenFree,
                  "lactose": isLactoseFree,
                  "vegan": isVegan,
                  "vegetarian": isVegetarian,
                };
                widget.saveFilter(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: DrawerMain(),
      body: Container(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Adjust your themes selection.",
                // style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                      onchange: (v) {
                        setState(() {
                          isGlutenFree = v;
                        });
                      },
                      Sub: "Only include Gluten Free meals",
                      title: "Gluten Free",
                      value: isGlutenFree),
                  buildSwitchListTile(
                      onchange: (v) {
                        setState(() {
                          isLactoseFree = v;
                        });
                      },
                      Sub: "Only include Lactose Free meals",
                      title: "Lactose Free",
                      value: isLactoseFree),
                  buildSwitchListTile(
                      onchange: (v) {
                        setState(() {
                          isVegan = v;
                        });
                      },
                      Sub: "Only include Vegan meals",
                      title: "Vegan",
                      value: isVegan),
                  buildSwitchListTile(
                      onchange: (v) {
                        setState(() {
                          isVegetarian = v;
                        });
                      },
                      Sub: "Only include Vegetarian meals",
                      title: "Vegetarian",
                      value: isVegetarian),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
