import 'package:flutter/material.dart';
import 'package:local_storage/utils/constants.dart';
import 'package:local_storage/views/widgets/drawer.dart';

class Second_Screen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> setImage;
  const Second_Screen(
      {super.key, required this.onThemeChanged, required this.setImage});

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(
        onThemeChanged: widget.onThemeChanged,
        setImage: widget.setImage,
      ),
      appBar: AppBar(
        title: Text("Settings",
            style: TextStyle(fontSize: AppConstants.texSize * 1.2)),
        centerTitle: true,
      ),
      body: Container(
        clipBehavior: Clip.none,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppConstants.imageUrl),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Dark Mode",
                style: TextStyle(fontSize: AppConstants.texSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Text hajmini tanlang hozirgi holat: ${AppConstants.texSize}',
                    style: TextStyle(
                        fontSize: AppConstants.texSize,
                        color: AppConstants.textColor),
                  ),
                  Slider(
                    value: AppConstants.texSize,
                    min: 14,
                    max: 30,
                    divisions: 16,
                    label: AppConstants.texSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        AppConstants.texSize = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
