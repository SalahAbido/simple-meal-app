import 'package:flutter/material.dart';

class Fristscreen extends StatelessWidget {
  const Fristscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blueGrey.withOpacity(0.4),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Adjust your themes selection.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Text(
              "Choose your Theme Mode",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light Theme",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Icon(Icons.light_mode_outlined),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Theme",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Icon(Icons.nights_stay_outlined),
              ],
            ),
            Row(
              children: [
                Text(
                  "Choose your main color",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                CircleAvatar(child: Container(color:Colors.pink,),)
              ],
            ),
            Row(
              children: [
                Text(
                  "Choose your secondary color",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                CircleAvatar(child: Container(color:Colors.amber,),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
