import 'package:flutter/material.dart';
import 'package:local_storage/views/screens/home_screen.dart';

void main(List<String> args) {
  runApp(MayApp());
}

class MayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)));
  }
}
