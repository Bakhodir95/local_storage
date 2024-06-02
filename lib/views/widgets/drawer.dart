import 'package:flutter/material.dart';
import 'package:local_storage/views/screens/home_screen.dart';
import 'package:local_storage/views/screens/settings_screen.dart';

class SettingDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  const SettingDrawer({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Mexmonxonalar"), Text("Menyu")],
              )),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                  return Second_Screen(
                    onThemeChanged: (bool value) {},
                  );
                }));
              },
              title: const Text("Settings"),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              )),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                  return HomeScreen(
                    onThemeChanged: (bool value) {},
                  );
                }));
              },
              title: const Text("Home Screen"),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
              ))
        ],
      ),
    );
  }
}
