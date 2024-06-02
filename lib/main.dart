import 'package:flutter/material.dart';
import 'package:local_storage/utils/constants.dart';
import 'package:local_storage/views/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(MayApp());
}

class MayApp extends StatefulWidget {
  @override
  State<MayApp> createState() => _MayAppState();
}

class _MayAppState extends State<MayApp> {
  void toggleThemeMode(bool value) {
    setState(() {
      AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void setImageApp(String imageUrl) {
    setState(() {
      AppConstants.imageUrl = imageUrl;
    });
  }

  @override
  void initState() {
    super.initState();
    loding();
  }

  Future<void> loding() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      AppConstants.themeMode = sharedPreferences.getBool("theme") == true
          ? ThemeMode.light
          : ThemeMode.dark;
    });
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
        onThemeChanged: toggleThemeMode,
        setImage: setImageApp,
      ),
    );
  }
}
