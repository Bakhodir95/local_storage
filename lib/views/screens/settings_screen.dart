import 'package:flutter/material.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        "Settings",
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton(
              onPressed: () {},
              child: const Text(
                'Home Screen',
                style: TextStyle(color: Colors.black),
              )),
        )
      ],
    ));
  }
}
