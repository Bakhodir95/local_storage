import 'package:flutter/material.dart';
import 'package:local_storage/utils/constants.dart';
import 'package:local_storage/views/widgets/drawer.dart';

class Second_Screen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const Second_Screen({super.key, required this.onThemeChanged});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(
        onThemeChanged: widget.onThemeChanged,
      ),
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: AppConstants.themeMode == ThemeMode.dark,
            onChanged: widget.onThemeChanged,
            title: const Text("Dark Mode"),
          )
        ],
      ),
    );
  }
}
