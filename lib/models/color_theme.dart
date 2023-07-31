import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorTheme with ChangeNotifier {
  final ThemeData themeGreen = ThemeData(
      scaffoldBackgroundColor: Colors.green,
      primaryColor: Colors.green,
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.white)));
  final ThemeData themeOrange = ThemeData(
      scaffoldBackgroundColor: Colors.orange,
      primaryColor: Colors.orange,
      primarySwatch: Colors.orange,
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.white)));
  List<String> itemsAsString = [];
  bool isGreen = true;
  static SharedPreferences? sharedPref;
  ItemData itemDataObject_1 = ItemData();

  ThemeData get selectedThemeData => isGreen ? themeGreen : themeOrange;

  void switchTheme(bool selected) async {
    isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    sharedPref?.setBool("themeData", value);
  }

  void LoadThemeFromSharedPref() {
    isGreen = sharedPref?.getBool("themeData") ?? true;
  }
}
