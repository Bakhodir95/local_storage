import 'package:flutter/material.dart';
import 'package:local_storage/utils/constants.dart';
import 'package:local_storage/views/screens/home_screen.dart';

void main(List<String> args) {
  runApp(MayApp());
}

class MayApp extends StatefulWidget {
  @override
  State<MayApp> createState() => _MayAppState();
}

class _MayAppState extends State<MayApp> {
  void toggleThemeMode(bool value) {
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: HomeScreen(
        onThemeChanged: (bool value) {},
      ),
    );
  }
}
