import 'package:flutter/material.dart';
import 'package:meels_app/Screens/favorite_screen.dart';
import 'package:meels_app/Screens/filter_screen.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text(
                "Cooking",
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              )),
          buildListTile(icon: Icons.restaurant, text: "Meals", ontap: () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile(icon: Icons.settings, text: "Filters", ontap: () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(
      {required Function() ontap,
      required IconData icon,
      required String text}) {
    return ListTile(
      onTap: ontap,
      leading: Icon(icon),
      title: Text(text),
    );
  }
}
