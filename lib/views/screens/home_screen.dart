import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:local_storage/utils/constants.dart';
import 'package:local_storage/views/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? name;
int? age;
int? phoneNumber;
String? imageUrl;

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> setImage;
  const HomeScreen(
      {super.key, required this.onThemeChanged, required this.setImage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> saveData() async {
    bool theme = AppConstants.themeMode == ThemeMode.light ? true : false;
    String imageUrl = AppConstants.imageUrl;
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("theme", theme);
    await sharedPreferences.setDouble("textsize", AppConstants.texSize);
    await sharedPreferences.setString("imageUrl", imageUrl);

    await sharedPreferences.setString(
      "Name",
      nameController.text,
    );
    await sharedPreferences.setInt(
      "Age",
      int.tryParse(ageController.text)!,
    );
    await sharedPreferences.setInt(
      "Phone Number",
      int.tryParse(phoneController.text)!,
    );
  }

  Future<void> getData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString("Name");
    age = sharedPreferences.getInt("Age");
    phoneNumber = sharedPreferences.getInt("Phone Number");
    imageUrl = sharedPreferences.getString("ImageUrl");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(
        onThemeChanged: widget.onThemeChanged,
        setImage: widget.setImage,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shared Preferences",
            style: TextStyle(fontSize: AppConstants.texSize * 1.2)),
        backgroundColor: Color.fromARGB(255, 23, 219, 219),
      ),
      body: Container(
        clipBehavior: Clip.none,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage(AppConstants.imageUrl),
        //   fit: BoxFit.cover,
        // )
        // ),
        child: Column(
          children: [
            const Gap(60),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your age',
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your phone number ',
                ),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveData();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Information saved successfully",
                                style:
                                    TextStyle(fontSize: AppConstants.texSize)),
                            content: Text(
                                "You can have access to saved info by clicking Get button",
                                style:
                                    TextStyle(fontSize: AppConstants.texSize)),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Ok",
                                      style: TextStyle(
                                          fontSize: AppConstants.texSize)))
                            ],
                          );
                        });
                  },
                  child: const Text("Save"),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: const Text("Get"),
                ),
              ],
            ),
            const Gap(20),
            Text(
              name == null || age == null || phoneNumber == null
                  ? ""
                  : "Name: $name \nAge: $age \nPhone Number: +$phoneNumber",
              style: TextStyle(fontSize: AppConstants.texSize),
            ),
          ],
        ),
      ),
    );
  }
}
