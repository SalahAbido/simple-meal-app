import 'package:flutter/material.dart';
import 'package:meels_app/Screens/category_ditails.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);
  final String id;
  final String title;
  final Color color;

  void SelectCategory(context) {
    Navigator.of(context).pushNamed(CategoryDitails.routename,arguments:{
      "id":id,
      "title":title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Colors.cyan,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            stops: const [0.2, 0.6],
            end: Alignment.bottomRight,
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
