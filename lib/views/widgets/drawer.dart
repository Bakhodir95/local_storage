import 'package:flutter/material.dart';
import 'package:local_storage/views/screens/home_screen.dart';
import 'package:local_storage/views/screens/settings_screen.dart';

class SettingDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> setImage;
  const SettingDrawer(
      {super.key, required this.onThemeChanged, required this.setImage});

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
                    onThemeChanged: onThemeChanged,
                    setImage: setImage,
                  );
                }));
              },
              title: const Text("Settings"),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
              )),
          ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                  return HomeScreen(
                    onThemeChanged: onThemeChanged,
                    setImage: setImage,
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
