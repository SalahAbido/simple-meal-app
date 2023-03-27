import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isArabic = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: size.height/7
        ),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/victoria-shes-Qa29U4Crvn4-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width * 0.7,
              height: 50.0,
              color: Colors.white54,
              child: const Text(
                "Cooking Up!",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: size.height/7 
              ),
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: 100.0,
              color: Colors.white60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Choose your language.",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Arabic",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Switch(
                        value: isArabic,
                        onChanged: (value) {
                          setState(() {
                            isArabic = value;
                            print(isArabic);
                          });
                        },
                      ),
                      const Text(
                        "English",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              // height: size.height/5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Colors.red,
                  fixedSize: Size(size.width*0.9,50.0)
                ),
                onPressed: () {},
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
