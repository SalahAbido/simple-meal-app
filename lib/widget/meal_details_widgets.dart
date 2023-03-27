import 'package:flutter/material.dart';

class buildTitleBody extends StatelessWidget {
  const buildTitleBody({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Text(text,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1));
  }
}

class BuildBodyDetails extends StatelessWidget {
  const BuildBodyDetails({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.all(10.0),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child:child,

    )

    ;
  }
}
