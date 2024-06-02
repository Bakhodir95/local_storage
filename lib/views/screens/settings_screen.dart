import 'package:flutter/material.dart';
import 'package:local_storage/views/widgets/drawer.dart';

class Second_Screen extends StatefulWidget {
  const Second_Screen({super.key});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(),
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [SwitchListTile(value: true, onChanged: (value) {})],
      ),
    );
  }
}
