import 'package:flutter/material.dart';
import 'package:meels_app/dummy_data.dart';
import 'package:meels_app/widget/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(id: e.id, title: e.title, color: e.color))
            .toList(),
      ),
    );
  }
}
